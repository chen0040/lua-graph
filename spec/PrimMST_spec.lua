--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/7/2017
-- Time: 11:52 AM
-- To change this template use File | Settings | File Templates.
--

describe('PrimMST', function()
    it('should find the minimum spanning tree', function()
        local mst = require('luagraphs.mst.PrimMST').create()
        local g = require('luagraphs.data.graph').create(8)
        g:addEdge(0, 7, 0.16)
        g:addEdge(2, 3, 0.17)
        g:addEdge(1, 7, 0.19)
        g:addEdge(0, 2, 0.26)
        g:addEdge(5, 7, 0.28)
        g:addEdge(1, 3, 0.29)
        g:addEdge(1, 5, 0.32)
        g:addEdge(2, 7, 0.34)
        g:addEdge(4, 5, 0.35)
        g:addEdge(1, 2, 0.36)
        g:addEdge(4, 7, 0.37)
        g:addEdge(0, 4, 0.38)
        g:addEdge(6, 2, 0.4)
        g:addEdge(3, 6, 0.52)
        g:addEdge(6, 0, 0.58)
        g:addEdge(6, 4, 0.93)

        mst:run(g)

        local path = mst.path

        assert.equal(path:size(), g:vertexCount()-1)
        print('Lazy Prim')
        for i=0,path:size()-1 do
            local e = path:get(i)
            print(e:from() .. ' -> ' .. e:to() .. ' (' .. e.weight .. ')')
        end

    end)
end)

