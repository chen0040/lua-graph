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

        dag:addEdge(0, 5)
        dag:addEdge(0, 2)
        dag:addEdge(0, 1)
        dag:addEdge(3, 6)
        dag:addEdge(3, 5)
        dag:addEdge(3, 4)
        dag:addEdge(5, 4)
        dag:addEdge(6, 4)
        dag:addEdge(6, 0)
        dag:addEdge(3, 2)
        dag:addEdge(1, 4)

        local ts = require('sort.TopologicalSort').create()
        ts:run(dag)

        local path = ts:path()
        for i=0, path:size()-1 do
            print('sort #' .. i .. ': ' .. path:get(i))
        end

    end)
end)

