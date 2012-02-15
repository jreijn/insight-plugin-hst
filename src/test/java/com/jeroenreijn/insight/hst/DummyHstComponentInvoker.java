package com.jeroenreijn.insight.hst;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.hippoecm.hst.core.container.ContainerException;
import org.hippoecm.hst.core.container.HstComponentInvoker;
import org.hippoecm.hst.core.container.HstContainerConfig;

/**
 * Dummy component invoker that does nothing for now.
 * @author Jeroen Reijn
 */
public class DummyHstComponentInvoker implements HstComponentInvoker {


    public DummyHstComponentInvoker() {

    }

    public void invokeAction(final HstContainerConfig requestContainerConfig, final ServletRequest servletRequest, final ServletResponse servletResponse) throws ContainerException {

    }

    public void invokeBeforeRender(final HstContainerConfig requestContainerConfig, final ServletRequest servletRequest, final ServletResponse servletResponse) throws ContainerException {

    }

    public void invokeRender(final HstContainerConfig requestContainerConfig, final ServletRequest servletRequest, final ServletResponse servletResponse) throws ContainerException {

    }

    public void invokeBeforeServeResource(final HstContainerConfig requestContainerConfig, final ServletRequest servletRequest, final ServletResponse servletResponse) throws ContainerException {

    }

    public void invokeServeResource(final HstContainerConfig requestContainerConfig, final ServletRequest servletRequest, final ServletResponse servletResponse) throws ContainerException {

    }
}
