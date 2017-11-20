--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 11/9/2017
-- Time: 8:35 AM
-- To change this template use File | Settings | File Templates.
--

local FordFulkerson = {}
FordFulkerson.__index = FordFulkerson
FordFulkerson.MAX_VALUE = 100000000000.0

function FordFulkerson.create()
    local s = {}
    setmetatable(s, FordFulkerson)

    s.value = 0
    s.edgeTo = {}
    s.source = -1
    s.target = -1
    s.network = nil
    s.marked = {}
    return s
end

function FordFulkerson:run(network, s, t)
    self.value = 0
    self.edgeTo = {}
    self.source = s
    self.target = t
    self.network = network
    self.marked = {}

    while self:hasPath() do
        local maxFlow = FordFulkerson.MAX_VALUE
        local x = self.target
        while x ~= self.source do
            local e = self.edgeTo[x]
            maxFlow = math.min(maxFlow, e:residualCapacityTo(x))
            x = e:other(x)
        end
        local x = self.target
        while x ~= self.source do
            local e = self.edgeTo[x]
            e:addResidualFlowTo(x, maxFlow)
            x = e:other(x)
        end

        self.value = self.value + maxFlow
    end
    return self.value
end

function FordFulkerson:hasPath()
    self.edgeTo = {}
    self.marked = {}
    for i = 0,self.network:vertexCount()-1 do
        local v = self.network:vertexAt(i)
        self.marked[v] = false
    end

    local queue = require('data.queue').create()
    queue:enqueue(self.source)
    while queue:isEmpty() == false do
        local x = queue:dequeue()
        self.marked[x] = true
        if x == self.target then
            return true
        end

        local adj_x = self.network:adj(x)
        for i = 0,adj_x:size()-1 do
            local e = adj_x:get(i)
            local w = e:other(x)
            if self.marked[w] == false and e:residualCapacityTo(w) > 0 then
                self.edgeTo[w] = e
                queue:enqueue(w)
            end

        end

    end

    return false
end

function FordFulkerson:minCuts()
    local result = require('data.list').create()
    for i = 0,self.network:vertexCount()-1 do
        local v = self.network:vertexAt(i)
        local adj_v = self.network:adj(v)
        for i = 0,adj_v:size()-1 do
            local e = adj_v:get(i)
            if e.v == v and e:residualCapacityTo(e:other(v)) == 0 then
                result:add(e)
            end
        end
    end
    return result
end

return FordFulkerson

