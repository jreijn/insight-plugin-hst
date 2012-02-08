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

import org.hippoecm.hst.core.container.HstContainerConfig;
import org.hippoecm.hst.core.container.HstComponentInvoker;
import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.HstQueryResult;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Global pointcuts for the HST.
 * @author Jeroen Reijn
 */
public aspect HstPointcuts {

    public pointcut invoke() : execution(* HstComponentInvoker.*(HstContainerConfig, ServletRequest, ServletResponse));

    public pointcut queryExecute() : execution(HstQueryResult HstQuery.execute());
}
