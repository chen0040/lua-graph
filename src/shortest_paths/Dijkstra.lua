--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/7/2017
-- Time: 10:30 AM
-- To change this template use File | Settings | File Templates.
--

local Dijkstra = {}
Dijkstra.__index = Dijkstra
Dijkstra.MAX_VALUE = 100000000000.0

function Dijkstra.create()
    local s = {}
    setmetatable(s, Dijkstra)

    s.edgeTo = {}
    s.cost = {}
    s.source = -1
    s.marked = {}
    return s
end

function Dijkstra:run(G, s)
    self.edgeTo = {}
    self.cost = {}
    self.marked = {}
    self.source = s

    local V = G.V
    for v = 0, V-1 do
        self.marked[v] = false
        self.edgeTo[v] = -1
        self.cost[v] = Dijkstra.MAX_VALUE
    end

    local pq = require('data.IndexedMinPQ').create()
    self.cost[s] = 0
    pq:add(s, self.cost[s])

    while pq:isEmpty() == false do
        local v = pq:minIndex()
        pq:delMin()
        self.marked[v] = true
        local adj_v = G:adj(v)
        for i=0,adj_v:size()-1 do
            local e = adj_v:get(i)
            self:relax(G, e, pq)
        end

    end
end

function Dijkstra:relax(G, e, pq)
    local v = e:from()
    local w = e:to()

    if self.marked[w] then
        return
    end

    if self.cost[w] > self.cost[v] + e.weight then
        self.cost[w] = self.cost[v] + e.weight
        self.edgeTo[w] = e
        if pq:contains(w) then
            pq:decreaseKey(w, self.cost[w])
        else
            pq:add(w, self.cost[w])
        end
    end

end

function Dijkstra:hasPathTo(v)
    return self.marked[v]
end

function Dijkstra:getPathLength(v)
    return self.cost[v]
end

function Dijkstra:getPathTo(v)
    local stack = require('data.stack').create()
    local x = v
    while x ~= self.source do
        local e = self.edgeTo[x]
        stack:push(e)
        x = e:other(x)
    end
    return stack:toList()
end


return Dijkstra

