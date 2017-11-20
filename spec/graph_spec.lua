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
            local g = require('luagraphs.data.graph').create(6);
            g:addEdge(0, 5);
            g:addEdge(2, 4);
            g:addEdge(2, 3);
            g:addEdge(1, 2);
            g:addEdge(0, 1);
            g:addEdge(3, 4);
            g:addEdge(3, 5);
            g:addEdge(0, 2);

            assert.equal(g:vertexCount(), 6)

            for i = 0, g:vertexCount() -1 do
                local v = g:vertexAt(i)
                local adj_v = g:adj(v)
                local text = ''
                for i = 0, adj_v:size()-1 do
                    text = text .. ', ' .. adj_v:get(i):other(v)
                end
                print(text)
            end

        end)
    end)

    describe("Undirected Unweighted Graph With Vertices added later", function()
        it("should automatically expand the graph", function()
            local g = require('luagraphs.data.graph').create(6);
            g:addEdge(0, 5);
            g:addEdge(2, 4);
            g:addEdge(2, 3);
            g:addEdge(1, 2);
            g:addEdge(0, 1);
            g:addEdge(3, 4);
            g:addEdge(3, 5);
            g:addEdge(0, 2);

            g:addEdge(-1, 10)
            g:addEdge(9, 2)
            g:addEdge(-1, 0)

            assert.equal(g:containsVertex(9), true)
            assert.equal(g:containsVertex(-1), true)
            assert.equal(g:containsVertex(8), false)

            assert.equal(g:vertexCount(), 9)

            for i = 0, g:vertexCount() -1 do
                local v = g:vertexAt(i)
                local adj_v = g:adj(v)
                local text = ''
                for i = 0, adj_v:size()-1 do
                    text = text .. ', ' .. adj_v:get(i):other(v)
                end
                print(text)
            end

        end)
    end)

    describe('Dynamically expand and shrink a graph', function()
        it("should dynamically adjust teh graph size", function()
            local vertices = require('luagraphs.data.list').create()
            vertices:add(3)
            vertices:add(5)
            vertices:add(10)

            local g = require('luagraphs.data.graph').createFromVertexList(vertices)

            assert.equal(g:vertexCount(), 3)

            g:addVertexIfNotExists(4)
            g:addVertexIfNotExists(5)

            assert.equal(g:vertexCount(), 4)

            g:addEdge(0, 5) -- add a new vertex 0 and a bidirectional edge connecting 0 and 5

            assert.equal(g:vertexCount(), 5)

            g:removeVertex(10)

            assert.equal(g:vertexCount(), 4)


            -- code below prints the adjacency list
            for k = 0, g:vertexCount() -1 do -- iterate through all the vertices in g
                local v = g:vertexAt(k)
                local adj_v = g:adj(v) -- adjacency list for vertex v
                local text = ''
                for i = 0, adj_v:size()-1 do
                    text = text .. ', ' .. adj_v:get(i):other(v)
                end
                print(text)
            end
        end)
    end)

    describe("reverse()", function()
        it("should reverse the graph", function()
            local g = require('luagraphs.data.graph').create(5, false)
            g:addEdge(0, 4)
            g:addEdge(2, 1)

            local g_reversed = g:reverse()
            assert.equal(g_reversed:hasEdge(4, 0), true)
            assert.equal(g_reversed:hasEdge(1, 2), true)
            assert.equal(g_reversed:hasEdge(0, 4), false)

        end)
    end)


end)

