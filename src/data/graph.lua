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
    if x == self.v then
        return self.w
    else
        return self.v
    end

end

function graph.create(V, directed)
    local g = {}
    setmetatable(g, graph)

    if directed == nil then
        directed = false
    end

    g.vertexList = require('data.list').create()
    g.adjList = {}
    for v = 0,V-1 do
        g.vertexList:add(v)
        g.adjList[v] = require('data.list').create()
    end
    g.directed = directed

    return g
end

function graph:vertexCount()
    return self.vertexList:size()
end

function graph:vertices()
    return self.vertexList
end

function graph.createFromVertexList(vertices, directed)
    local g = {}
    setmetatable(g, graph)

    if directed == nil then
        directed = false
    end

    g.vertexList = vertices
    g.adjList = {}
    for i = 0,g.vertexList:size()-1 do
        local v = g.vertexList:get(i)
        g.adjList[v] = require('data.list').create()
    end
    g.directed = directed

    return g
end

function graph:addVertexIfNotExists(v)
    if self.vertexList:contains(v) then
        return false
    else
        self.vertexList:add(v)
        self.adjList[v] = require('data.list').create()
        return true
    end
end

function graph:removeVertex(v)
    if self.vertexList:contains(v) then
        self.vertexList:remove(v)
        self.adjList[v] = nil
        for i=0,self.vertexList:size()-1 do
            local w = self.vertexList:get(i)
            local adj_w = self.adjList[w]
            for k = 0,adj_w:size()-1 do
                local e = adj_w:get(k)
                if e:other(w) == v then
                    adj_w:removeAt(k)
                    break
                end

            end

        end

    end
end

function graph:containsVertex(v)
    return self.vertexList:contains(v)
end

function graph:adj(v)
    return self.adjList[v]
end

function graph:addEdge(v, w, weight)
    local e = graph.Edge.create(v, w, weight)
    self:addVertexIfNotExists(v)
    self:addVertexIfNotExists(w)
    if self.directed then
        self.adjList[e:from()]:add(e)
    else
        self.adjList[e:from()]:add(e)
        self.adjList[e:to()]:add(e)
    end

end

function graph:reverse()
    local g = graph.createFromVertexList(self.vertexList, self.directed)
    for k=0,self:vertexCount()-1 do
        local v = self:vertexAt(k)
        local adj_v = self:adj(v)
        for i=0,adj_v:size()-1 do
            local e = adj_v:get(i)
            g:addEdge(e:to(), e:from(), e.weight)
        end

    end

    return g
end

function graph:vertexAt(i)
    return self.vertexList:get(i)
end

function graph:edges()
    local list = require('data.list').create()

    for i=0,self.vertexList:size()-1 do
        local v = self.vertexList:get(i)
        local adj_v = self:adj(v)
        for i=0,adj_v:size()-1 do
            local e = adj_v:get(i)
            local w = e:other(v)
            if self.directed == true or w > v then
                list:add(e)
            end

        end

    end

    return list
end

function graph:hasEdge(v, w)
    local adj_v = self:adj(v)
    for i=0,adj_v:size()-1 do
        local e = adj_v:get(i)
        if e:to() == w then
            return true
        end
    end
    return false
end

return graph

