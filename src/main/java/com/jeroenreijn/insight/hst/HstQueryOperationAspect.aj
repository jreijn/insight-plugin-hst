package com.jeroenreijn.insight.hst;

import com.springsource.insight.collection.method.MethodOperationCollectionAspect;
import com.springsource.insight.intercept.operation.Operation;
import com.springsource.insight.intercept.operation.OperationType;

import org.aspectj.lang.JoinPoint;
import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.exceptions.QueryException;

/**
 * Aspect for collecting HstQuery executions.
 * @author Jeroen Reijn
 */
public aspect HstQueryOperationAspect extends MethodOperationCollectionAspect {

    private static final OperationType TYPE = OperationType.valueOf("query_execute");

    public pointcut collectionPoint(): HstPointcuts.queryExecute();

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
