package com.jeroenreijn.insight.hst;

import com.springsource.insight.collection.OperationCollectionAspectSupport;
import com.springsource.insight.collection.OperationCollectionAspectTestSupport;
import com.springsource.insight.intercept.operation.Operation;

import org.hippoecm.hst.core.component.HstComponent;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstRequestImpl;
import org.hippoecm.hst.core.component.HstResponse;
import org.hippoecm.hst.core.container.ContainerException;
import org.hippoecm.hst.core.container.HstComponentInvoker;
import org.hippoecm.hst.core.container.HstComponentWindow;
import org.hippoecm.hst.core.container.HstContainerConfig;
import org.hippoecm.hst.mock.core.component.MockHstRequest;
import org.hippoecm.hst.mock.core.container.MockHstComponentWindow;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Tests for {@link HstInvokeOperationCollectionAspect}.
 * @author Jeroen Reijn
 */
public class HstInvokeOperationCollectionAspectTest extends OperationCollectionAspectTestSupport {

    public void standardAsserts(Operation op) {
        assertEquals(HstInvokeOperationCollectionAspect.TYPE, op.getType());
    }

    public void assertAttributesOnOperation(Operation operation) {
        assertTrue(operation.get("componentClass").equals(DummyComponent.class.getName()));
        assertTrue(operation.get("renderPath").equals("/jsp/some.jsp"));
        assertTrue(operation.get("windowName").equals("name"));
    }
    
    @Test
    public void testInvokeBeforeRender() throws ContainerException {
        HstRequestImpl request = mock(HstRequestImpl.class);
        HstResponse response = mock(HstResponse.class);
        HstContainerConfig config = mock(HstContainerConfig.class);

        HstComponentInvoker invoker = new DummyHstComponentInvoker();

        MockHstComponentWindow window = new MockHstComponentWindow();
        window.setName("name");
        window.setComponent(new DummyComponent());
        window.setRenderPath("/jsp/some.jsp");

        when(request.getComponentWindow()).thenReturn(window);

        invoker.invokeBeforeRender(config,request,response);
        Operation operation = getLastEntered(Operation.class);
        standardAsserts(operation);
        assertAttributesOnOperation(operation);
    }

    @Override
    public OperationCollectionAspectSupport getAspect() {
        return HstInvokeOperationCollectionAspect.aspectOf();
    }
}
