package com.jeroenreijn.insight.hst;

import com.springsource.insight.collection.OperationCollectionAspectSupport;
import com.springsource.insight.collection.OperationCollectionAspectTestSupport;
import com.springsource.insight.intercept.operation.Operation;

import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.exceptions.QueryException;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * Tests for {@link HstQueryOperationAspect}.
 *
 * @author Jeroen Reijn
 */
public class HstQueryOperationAspectTest extends OperationCollectionAspectTestSupport {

    public void standardAsserts(Operation op) {
        assertEquals(HstQueryOperationAspect.TYPE, op.getType());
        assertEquals(op.get("limit"), 1000);
    }

    @Test
    public void testExecute() throws QueryException {
        HstQuery query = new DummyQuery();
        query.execute();
        Operation op = getLastEntered(Operation.class);
        standardAsserts(op);
    }

    @Override
    public OperationCollectionAspectSupport getAspect() {
        return HstQueryOperationAspect.aspectOf();
    }
}
