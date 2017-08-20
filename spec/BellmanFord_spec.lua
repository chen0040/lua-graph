--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/7/2017
-- Time: 11:32 AM
-- To change this template use File | Settings | File Templates.
--

describe("BellmanFord", function()
    it('should be able to find all the shortest paths from the source node', function()
        local g = require('data.graph').create(8, true);

        g:addEdge(0, 1, 5.0)
        g:addEdge(0, 4, 9.0)
        g:addEdge(0, 7, 8.0)
        g:addEdge(1, 2, 12.0)
        g:addEdge(1, 3, 15.0)
        g:addEdge(1, 7, 4.0)
        g:addEdge(2, 3, 3.0)
        g:addEdge(2, 6, 11.0)
        g:addEdge(3, 6, 9.0)
        g:addEdge(4, 5, 5.0)
        g:addEdge(4, 6, 20.0)
        g:addEdge(4, 7, 5.0)
        g:addEdge(5, 2, 1.0)
        g:addEdge(5, 6, 13.0)
        g:addEdge(7, 5, 6.0)
        g:addEdge(7, 2, 7.0)

        local method = require('shortest_paths.BellmanFord').create()
        method:run(g, 0)
        print('BellmanFord shortest path')
        for v = 1,g.V-1 do
            if method:hasPathTo(v) then
                print('path from 0 to ' .. v .. ' ( cost: '  .. method:getPathLength(v) .. ' )')
                local path = method:getPathTo(v)
                for i = 0,path:size()-1 do
                    print('# from ' .. path:get(i):from() .. ' to ' .. path:get(i):to() .. ' ( distance: ' .. path:get(i).weight .. ' )')
                end
            end
        end

    end)
end)

