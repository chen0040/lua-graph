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
    setmetatable(g, hashmap)

    g.V = V
    g.adjList = {}
    for v = 0,V-1 do
        g.adjList[v] = {}
    end
    g.directed = directed

    return g
end

function graph:adj(v)
    return self.adjList[v]
end

function graph:addEdge(v, w)
    local e = graph.Edge.create(v, w)
    if self.directed then
        self.adjList[e:from()] = e
    else
        self.adjList[e:from()] = e
        self.adjList[e:to()] = e
    end

end

function graph:addWeightedEdge(v, w, weight)
    local e = graph.Edge.create(v, w)
    if self.directed then
        self.adjList[e:from()] = e
    else
        self.adjList[e:from()] = e
        self.adjList[e:to()] = e
    end
end


return graph

