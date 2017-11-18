--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 11/7/2017
-- Time: 8:33 AM
-- To change this template use File | Settings | File Templates.
--

describe('ConnectedComponents()', function()
    it('should list the connected components in the graph', function()
        local g = require('data.graph').create(13)
        g:addEdge(0, 5)
        g:addEdge(4, 3)
        g:addEdge(0, 1)
        g:addEdge(9, 12)
        g:addEdge(6, 4)
        g:addEdge(5, 4)
        g:addEdge(0, 2)
        g:addEdge(11, 12)
        g:addEdge(9,10)
        g:addEdge(0, 6)
        g:addEdge(7, 8)
        g:addEdge(9, 11)
        g:addEdge(5, 3)
        
        local cc = require('connectivity.ConnectedComponents').create()
        cc:run(g)

        print('count: ' .. cc.count)
        assert.equal(cc.count, 3)
        for i = 0,g:vertexCount()-1 do
            local v = g:vertexAt(i)
            print('id[' .. v .. ']: ' .. cc:component(v))
        end

    end)
end)

