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
    return s
end

function FordFulkerson:run(network, s, t)
    self.value = 0
    self.edgeTo = {}
    self.source = s
    self.target = t
    self.network = network
    while self:hasPath() do
        local maxFlow = FordFulkerson.MAX_VALUE
        local x = self.target
        while x ~= self.source do
            local e = self.edgeTo[x]
            maxFlow = math.min(maxFlow, e:residualCapacityTo(x))
        end
        self.value = self.value + maxFlow
    end
    return self.value
end

function FordFulkerson:hasPath()
    self.edgeTo = {}
    local queue = require('queue').create()
    queue:enqueue(self.source)
    while queue:isEmpty() == false do
        local x = queue:dequeue()
        if x == self.target then
            return true
        end

        local adj_x = self.network:adj(x)
        for i = 0,adj_x:size()-1 do
            local e = adj_x:get(i)
            local w = e:other(x)
            if e:residualCapacityTo(w) > 0 then
                self.edgeTo[w] = e
                queue:enqueue(w)
            end

        end

    end

    return false
end

return FordFulkerson

