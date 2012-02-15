package com.jeroenreijn.insight.hst;

import javax.servlet.ServletContext;

import org.hippoecm.hst.core.component.HstComponent;
import org.hippoecm.hst.core.component.HstComponentException;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.hippoecm.hst.core.request.ComponentConfiguration;

/**
 * @author Jeroen Reijn
 */
public class DummyComponent implements HstComponent{


    public void init(final ServletContext servletContext, final ComponentConfiguration componentConfig) throws HstComponentException {

    }

    public void doBeforeRender(final HstRequest request, final HstResponse response) throws HstComponentException {
        request.setAttribute("testattribute","testvalue");
    }

    public void doAction(final HstRequest request, final HstResponse response) throws HstComponentException {

    }

    public void doBeforeServeResource(final HstRequest request, final HstResponse response) throws HstComponentException {

    }

    public void destroy() throws HstComponentException {

    }

    public ServletContext getServletContext() {
        return null;
    }
}
