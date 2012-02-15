package com.jeroenreijn.insight.hst;

import java.util.List;

import javax.jcr.Node;
import javax.jcr.query.QueryResult;

import org.hippoecm.hst.content.beans.manager.ObjectConverterImpl;
import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.HstQueryResult;
import org.hippoecm.hst.content.beans.query.HstQueryResultImpl;
import org.hippoecm.hst.content.beans.query.HstVirtualizerImpl;
import org.hippoecm.hst.content.beans.query.exceptions.QueryException;
import org.hippoecm.hst.content.beans.query.filter.BaseFilter;
import org.hippoecm.hst.content.beans.query.filter.Filter;
import org.hippoecm.hst.content.beans.standard.HippoBean;

import static org.mockito.Mockito.mock;

/**
 * Fake query implementaton for test purposes only.
 * @author Jeroen Reijn
 */
public class DummyQuery implements HstQuery {
    
    private int limit = HstQuery.DEFAULT_LIMIT;
    private int offset = -1;

    public void setFilter(final BaseFilter filter) {

    }

    public BaseFilter getFilter() {
        return null;
    }

    public Filter createFilter() {
        return null;
    }

    public void setLimit(final int limit) {
        this.limit = limit;
    }

    public String getQueryAsString(final boolean skipDefaultOrderBy) throws QueryException {
        return "";
    }

    public int getLimit() {
        return limit;
    }

    public void setOffset(final int offset) {
        this.offset = offset;
    }

    public int getOffset() {
        return offset;
    }

    public void addOrderByAscending(final String fieldNameAttribute) {

    }

    public void addOrderByDescending(final String fieldNameAttribute) {

    }

    public void addScopes(final List<HippoBean> scopes) {

    }

    public void addScopes(final Node[] scopes) {

    }

    public void excludeScopes(final List<HippoBean> scopes) {

    }

    public void excludeScopes(final Node[] scopes) {

    }

    public void setSkipInvalidScopes(final boolean skipInvalidScopes) {

    }

    public HstQueryResult execute() throws QueryException {
        return null;
    }
}
