--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 11/7/2017
-- Time: 8:48 AM
-- To change this template use File | Settings | File Templates.
--

describe('TopoloicalSort()', function()
    it('should topo sort', function()
        local dag = require('data.graph').create(7, true)

        local edges = { --from, to
            {0, 5},
            {0, 2},
            {0, 1},
            {3, 6},
            {3, 5},
            {3, 4},
            {5, 4},
            {6, 4},
            {6, 0},
            {3, 2},
            {1, 4},
        }

        for edgenum=1,#edges do
            dag:addEdge(edges[edgenum][1], edges[edgenum][2])
        end

        local ts = require('sort.TopologicalSort').create()
        ts:run(dag)

        local path = ts:path()
        local vorder={} -- map from vertex to order visited

        -- Show the order, and collect it to check
        for i=0, path:size()-1 do
            print('sort #' .. i .. ': ' .. path:get(i))
            vorder[path:get(i)] = i
        end

        -- Make sure the to-node comes after the from-node along every edge.
        for edgenum=1,#edges do
            local from, to = edges[edgenum][1], edges[edgenum][2]
            assert.is_true(vorder[from] < vorder[to])
        end
    end)
end)

