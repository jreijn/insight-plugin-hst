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
import com.springsource.insight.collection.method.JoinPointFinalizer;
import com.springsource.insight.intercept.operation.Operation;
import com.springsource.insight.intercept.operation.OperationType;

import org.aspectj.lang.JoinPoint;
import org.hippoecm.hst.core.component.HstComponent;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstRequestImpl;
import org.hippoecm.hst.core.container.HstComponentWindow;

import org.hippoecm.hst.core.container.HstContainerConfig;
import org.hippoecm.hst.core.container.HstComponentInvoker;
import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.HstQueryResult;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


/**
 * Collection aspect for collecting invoke methods on HST components.
 * @author Jeroen Reijn
 */
public aspect HstInvokeOperationCollectionAspect extends AbstractOperationCollectionAspect {

    private static final OperationType TYPE = OperationType.valueOf("invoke");

    public pointcut collectionPoint(): execution(* HstComponentInvoker.*(HstContainerConfig, ServletRequest, ServletResponse));

    public Operation createOperation(JoinPoint jp) {
        Object[] args = jp.getArgs();
        String windowName = "";
        String componentClassName = "";
        String simpleComponentClassName = "";
        String renderPath = "";

        if (args.length > 1 && args[1] instanceof HstRequest) {
            HstRequest hstRequest = (HstRequest) args[1];
            HstComponentWindow window = ((HstRequestImpl) hstRequest).getComponentWindow();
            windowName = window.getName();
            HstComponent component = window.getComponent();
            componentClassName = component.getClass().getName();
            simpleComponentClassName = component.getClass().getSimpleName();
            renderPath = window.getRenderPath();
        }

        Operation op = new Operation()
                .label("HST component:  " + simpleComponentClassName + "#" + jp.getSignature().getName() + "()")
                .type(TYPE);
        op.sourceCodeLocation(getSourceCodeLocation(jp));
        op.put("componentClass", componentClassName);
        op.put("windowName", windowName);
        op.put("renderPath", renderPath);
        JoinPointFinalizer.register(op, jp);
        return op;
    }

}
