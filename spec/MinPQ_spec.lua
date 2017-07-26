--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/7/2017
-- Time: 11:32 AM
-- To change this template use File | Settings | File Templates.
--

describe('MinPQ', function()
    it('should add and remove the min item first', function()
        local pq = require('data.MinPQ').create(function(a1, a2) return a1 - a2  end)
        pq:add(2)
        pq:add(4)
        pq:add(1)
        pq:add(20)

        assert(pq:size(), 4)
        assert.equal(pq:delMin(), 1)
        assert.equal(pq:delMin(), 2)
        assert.equal(pq:delMin(), 4)
        assert.equal(pq:delMin(), 20)
        assert(pq:isEmpty(), true)

    end)
end)

