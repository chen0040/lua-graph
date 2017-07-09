--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/6/2017
-- Time: 12:48 AM
-- To change this template use File | Settings | File Templates.
--

local graph = {}

graph.__index = graph

graph.Edge = {}
graph.Edge.__index = graph.Edge

function graph.Edge.create(v, w, weight)
    local s = {}
    setmetatable(s, graph.Edge)

    if weight == nil then
        weight = 1.0
    end

    s.v = v
    s.w = w
    s.weight = weight

    return s
end

function graph.Edge:from()
    return self.v
end

function graph.Edge:to()
    return self.w;
end

function graph.Edge:either()
    return self.v
end

function graph.Edge:other(x)
    if x == v then
        return w
    else
        return v
    end

end

function graph.create(V, directed)
    local g = {}
    setmetatable(g, graph)

    if directed == nil then
        directed = false
    end

    g.V = V
    g.adjList = {}
    for v = 0,V-1 do
        g.adjList[v] = require('data.list').create()
    end
    g.directed = directed

    return g
end

function graph:adj(v)
    return self.adjList[v]
end

function graph:addEdge(v, w, weight)
    local e = graph.Edge.create(v, w, weight)
    if self.directed then
        self.adjList[e:from()]:add(e)
    else
        self.adjList[e:from()]:add(e)
        self.adjList[e:to()]:add(e)
    end

end

return graph

