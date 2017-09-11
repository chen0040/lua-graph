--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/7/2017
-- Time: 11:32 AM
-- To change this template use File | Settings | File Templates.
--

describe("FordFulkerson", function()
    it('should be able to find max flow of 28', function()
        local g = require('data.network').FlowNetwork.create(8);

        g:addEdge(0, 1, 10); -- capacity from vertex 0 to vertex 1 is 10
        g:addEdge(0, 2, 5);
        g:addEdge(0, 3, 15);
        g:addEdge(1, 4, 9);
        g:addEdge(1, 5, 15);
        g:addEdge(1, 2, 4);
        g:addEdge(2, 5, 8);
        g:addEdge(2, 3, 4);
        g:addEdge(3, 6, 16);
        g:addEdge(4, 5, 15);
        g:addEdge(4, 7, 10);
        g:addEdge(5, 7, 10);
        g:addEdge(5, 6, 15);
        g:addEdge(6, 2, 6);
        g:addEdge(6, 7, 10);

        local method = require('flow.FordFulkerson').create()
        local maxFlow = method:run(g, 0, 7)
        print('FordFulkerson max flow: ' .. maxFlow)

        assert.equals(maxFlow, 28);

        local minCuts = method:minCuts()

        for i = 0,minCuts:size()-1 do
            local e =minCuts:get(i)
            print('min cut: ' .. e:toString())
        end


    end)
end)

