--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/6/2017
-- Time: 9:16 AM
-- To change this template use File | Settings | File Templates.
--

describe("Graph", function()
    describe("Undirected Unweighted Graph", function()
        it("should create an undirected unweighted graph", function()
            local g = require('data.graph').create(6);
            g:addEdge(0, 5);
            g:addEdge(2, 4);
            g:addEdge(2, 3);
            g:addEdge(1, 2);
            g:addEdge(0, 1);
            g:addEdge(3, 4);
            g:addEdge(3, 5);
            g:addEdge(0, 2);

            assert.equal(g.V, 6)
        end)
    end)


end)

