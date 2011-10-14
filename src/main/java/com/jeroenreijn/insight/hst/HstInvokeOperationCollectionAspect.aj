package com.jeroenreijn.insight.hst;

import com.springsource.insight.collection.method.JoinPointFinalizer;
import com.springsource.insight.collection.method.MethodOperationCollectionAspect;
import com.springsource.insight.intercept.operation.Operation;
import com.springsource.insight.intercept.operation.OperationType;

import org.aspectj.lang.JoinPoint;
import org.hippoecm.hst.core.component.HstComponent;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstRequestImpl;
import org.hippoecm.hst.core.container.HstComponentWindow;

/**
 * Collection aspect for collecting invoke methods.
 * @author Jeroen Reijn
 */
public aspect HstInvokeOperationCollectionAspect extends MethodOperationCollectionAspect {

    private static final OperationType TYPE = OperationType.valueOf("invoke");

    public pointcut collectionPoint(): HstPointcuts.invoke();

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
