/**
 * Copyright (C) 2011 Jeroen Reijn <j.reijn@onehippo.com>
 *
 * This file is part of insight-plugin-hst.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.jeroenreijn.insight.hst;

import com.springsource.insight.collection.AbstractOperationCollectionAspect;
import com.springsource.insight.intercept.operation.Operation;
import com.springsource.insight.intercept.operation.OperationType;

import org.aspectj.lang.JoinPoint;
import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.HstQueryResult;
import org.hippoecm.hst.content.beans.query.exceptions.QueryException;

/**
 * Aspect for collecting HstQuery executions.
 * @author Jeroen Reijn
 */
public aspect HstQueryOperationAspect extends AbstractOperationCollectionAspect {

    private static final OperationType TYPE = OperationType.valueOf("query_execute");

    public pointcut collectionPoint(): execution(HstQueryResult HstQuery.execute());

    public Operation createOperation(JoinPoint jp) {
        HstQuery query = (HstQuery) jp.getTarget();
        Operation op = new Operation()
                .type(TYPE)
                .label("HstQuery");
        op.sourceCodeLocation(getSourceCodeLocation(jp));
        try {
            op.put("query", query.getQueryAsString(false));
            op.put("limit", query.getLimit());
            op.put("offset", query.getOffset());
        } catch (QueryException e) {
            // ignore for now
        }
        return op;
    }

}
