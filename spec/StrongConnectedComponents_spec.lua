--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/7/2017
-- Time: 9:37 AM
-- To change this template use File | Settings | File Templates.
--

describe('StronglyConnectedComponents', function()
    it('should return the components that are strongly connected', function()
        local graph = require('data.graph').create(13, true)
        graph:addEdge(4, 2)
        graph:addEdge(2, 3)
        graph:addEdge(3, 2)
        graph:addEdge(6, 0)
        graph:addEdge(0, 1)
        graph:addEdge(2, 0)
        graph:addEdge(11, 12)
        graph:addEdge(12, 9)
        graph:addEdge(9, 10)
        graph:addEdge(9, 11)
        graph:addEdge(8, 9)
        graph:addEdge(10, 12)
        graph:addEdge(11, 4)
        graph:addEdge(4, 3)
        graph:addEdge(3, 5)
        graph:addEdge(7, 8)
        graph:addEdge(8, 7)
        graph:addEdge(5, 4)
        graph:addEdge(0, 5)
        graph:addEdge(6, 4)
        graph:addEdge(6, 9)
        graph:addEdge(7, 6)

        local scc = require('connectivity.StronglyConnectedComponents').create()
        scc:run(graph)
        assert.equal(scc.count, 5)

        for i = 0,graph:vertexCount()-1 do
            local v = graph:vertexAt(i)
            print('id[' .. v .. ']: ' .. scc:component(v))
        end

    end)
end)

