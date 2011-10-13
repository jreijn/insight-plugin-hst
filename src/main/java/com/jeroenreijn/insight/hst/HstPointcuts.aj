package com.jeroenreijn.insight.hst;

import org.hippoecm.hst.core.container.HstContainerConfig;
import org.hippoecm.hst.core.container.HstComponentInvoker;
import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.HstQueryResult;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Global HST pointcuts for the HST.
 * @author Jeroen Reijn
 */
public aspect HstPointcuts {

    public pointcut invoke() : execution(* HstComponentInvoker.*(HstContainerConfig, ServletRequest, ServletResponse));

    public pointcut queryExecute() : execution(HstQueryResult HstQuery.execute());
}
