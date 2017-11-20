--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 31/7/2017
-- Time: 9:36 PM
-- To change this template use File | Settings | File Templates.
--

local BellmanFord = {}
BellmanFord.__index = BellmanFord
BellmanFord.MAX_VALUE = 100000000000.0

function BellmanFord.create()
    local s = {}
    setmetatable(s, BellmanFord)

    s.edgeTo = {}
    s.source = nil
    s.costs = {}
    s.negativeCycle = false
    return s
end

function BellmanFord:run(g, s)
    self.source = s
    self.edgeTo = {}
    self.costs = {}
    self.negativeCycle = false

    for i = 0, g:vertexCount()-1 do
        local v = g:vertexAt(i)
        self.edgeTo[v] = -1
        self.costs[v] = BellmanFord.MAX_VALUE
    end

    self.costs[s] = 0

    for i = 0,g:vertexCount()-1 do
        for k = 0, g:vertexCount()-1 do
            local v = g:vertexAt(k)
            local adj_v = g:adj(v)
            for j = 0, adj_v:size()-1 do
                local e = adj_v:get(j)
                self:relax(g, e)
            end
        end
    end

    for i = 0, g:vertexCount()-1 do
        local v = g:vertexAt(i)
        local adj_v = g:adj(v)
        for j = 0, adj_v:size()-1 do
            local e = adj_v:get(j)
            if self:relax(g, e) then
                self.negativeCycle = true
            end

        end

    end

end

function BellmanFord:relax(g, e)
    local w = e:to()
    local v = e:from()
    if self.costs[w] > self.costs[v] + e.weight then
        self.costs[w] = self.costs[v] + e.weight
        self.edgeTo[w] = e
    end
end


function BellmanFord:hasPathTo(v)
    return self.costs[v] < BellmanFord.MAX_VALUE
end

function BellmanFord:hasNegativeCycle()
    return self.negativeCycle
end

function BellmanFord:getPathLength(v)
    return self.costs[v]
end

function BellmanFord:getPathTo(v)
    local stack = require('luagraphs.data.stack').create()
    local x = v
    while x ~= self.source do
        local e = self.edgeTo[x]
        stack:push(e)
        x = e:other(x)
    end
    return stack:toList()
end


return BellmanFord

