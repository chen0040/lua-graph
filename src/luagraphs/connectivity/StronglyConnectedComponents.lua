--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 25/7/2017
-- Time: 9:29 AM
-- To change this template use File | Settings | File Templates.
--

local StronglyConnectedComponents = {}
StronglyConnectedComponents.__index = StronglyConnectedComponents

function StronglyConnectedComponents.create()
    local s = {}
    setmetatable(s, StronglyConnectedComponents)

    s.id = {}
    s.marked = {}
    s.count = 0
    return s
end

function StronglyConnectedComponents:run(G)
    self.marked = {}
    self.id = {}
    self.count = 0
    for i = 0,G:vertexCount()-1 do
        local v = G:vertexAt(i)
        self.marked[v] = false
        self.id[v] = -1
    end

    local g_prime = G:reverse()
    local topo_sort = require('luagraphs.sort.TopologicalSort').create()
    topo_sort:run(g_prime)
    local order = topo_sort:path()

    for i=0,order:size()-1 do
        local v = order:get(i)
        if self.marked[v] == false then
            self:dfs(G, v)
            self.count = self.count + 1
        end
    end
end

function StronglyConnectedComponents:dfs(G, v)
    local adj_v = G:adj(v)
    self.marked[v] = true
    self.id[v] = self.count
    for i=0,adj_v:size()-1 do
        local e = adj_v:get(i)
        local w = e:other(v)
        if self.marked[w] == false then
            self:dfs(G, w)
        end
    end
end

function StronglyConnectedComponents:component(v)
    return self.id[v]
end

return StronglyConnectedComponents

