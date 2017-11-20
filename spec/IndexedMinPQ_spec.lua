--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/7/2017
-- Time: 10:01 AM
-- To change this template use File | Settings | File Templates.
--

describe('IndexedMinPQ', function()
    it('should be store indexed keys in a priority queue', function()
        local pq = require('luagraphs.data.IndexedMinPQ').create()

        pq:add(0, 10)
        pq:add(1, 1)
        pq:add(2, 20)
        pq:add(6, 2)

        assert.equals(pq:size(), 4)
        assert.equals(pq:isEmpty(), false)
        assert.equals(pq:contains(0), true)
        assert.equals(pq:contains(1), true)
        assert.equals(pq:contains(2), true)
        assert.equals(pq:contains(3), false)
        assert.equals(pq:contains(6), true)

        pq:decreaseKey(2, 0.5)
        assert.equals(pq:minKey(), 0.5)
        assert.equals(pq:minIndex(), 2)
        assert.equals(pq:delMin(), 0.5)
        assert.equals(pq:delMin(), 1)
        assert.equals(pq:delMin(), 2)
        assert.equals(pq:delMin(), 10)
    end)
end)

