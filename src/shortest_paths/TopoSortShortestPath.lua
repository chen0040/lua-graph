--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 29/7/2017
-- Time: 7:01 PM
-- To change this template use File | Settings | File Templates.
--

local TopoSortShortestPath = {}
TopoSortShortestPath.__index = TopoSortShortestPath
TopoSortShortestPath.MAX_VALUE = 100000000000.0

function TopoSortShortestPath.create()
    local s = {}
    setmetatable(s, TopoSortShortestPath)

    s.edgeTo = {}
    s.cost = {}
    s.source = -1
    return s
end

function TopoSortShortestPath:run(G, s)
    self.edgeTo = {}
    self.cost = {}
    self.source = s

    local V = G.V
    for v = 0, V-1 do
        self.edgeTo[v] = -1
        self.cost[v] = TopoSortShortestPath.MAX_VALUE
    end

    self.cost[s] = 0

    local topoSort = require('sort.TopologicalSort').create()
    topoSort:run(G)
    local order = topoSort:path()

    for i=0, order:size()-1 do
        local v = order:get(i)
        local adj_v = G:adj(v)
        for j=0, adj_v:size()-1 do
            local e = adj_v:get(j)
            self:relax(e)
        end
    end
end

function TopoSortShortestPath:relax(e)
    local v = e:from()
    local w = e:to()

    if(self.cost[w] > self.cost[v] + e.weight) then
        self.cost[w] = self.cost[v] + e.weight
        self.edgeTo[w] = e
    end

end

function TopoSortShortestPath:hasPathTo(v)
    return self.edgeTo[v] ~= -1
end

function TopoSortShortestPath:getPathLength(v)
    return self.cost[v]
end

function TopoSortShortestPath:getPathTo(v)
    local stack = require('data.stack').create()
    local x = v
    while x ~= self.source do
        local e = self.edgeTo[x]
        stack:push(e)
        x = e:other(x)
    end
    return stack:toList()
end


return TopoSortShortestPath

