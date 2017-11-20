--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/7/2017
-- Time: 11:36 AM
-- To change this template use File | Settings | File Templates.
--

describe('UnionFind', function()
    it('should connect vertices that are union', function()
        local uf = require('luagraphs.data.UnionFind').create(10)

        uf:union(2, 4)
        uf:union(1, 2)
        uf:union(5, 6)

        assert.equal(uf:connected(1, 2), true)
        assert.equal(uf:connected(1, 4), true)
        assert.equal(uf:connected(1, 5), false)
        assert.equal(uf:connected(1, 6), false)
    end)
end)

