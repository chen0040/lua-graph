--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 20/8/2017
-- Time: 3:02 PM
-- To change this template use File | Settings | File Templates.
--

local network = {}
network.__index = network

network.FlowEdge = {}
network.FlowEdge.__index = network.FlowEdge

network.FlowNetwork = {}
network.FlowNetwork.__index = network.FlowNetwork

function network.FlowEdge.create(v, w, capacity)
    local s = {}
    setmetatable(s, network.FlowEdge)

    s.v = v
    s.w = w
    s.capacity = capacity
    s.flow = 0
    return s
end

function network.FlowNetwork.create(V)
    local s = {}
    setmetatable(s, network.FlowNetwork)

    s.vertexList = require('luagraphs.data.list').create()
    s.adjList = {}
    for v = 0,V-1 do
        s.vertexList:add(v)
        s.adjList[v] = require('luagraphs.data.list').create()
    end
    return s
end

function network.FlowNetwork:vertexCount()
    return self.vertexList:size()
end

function network.FlowNetwork:vertexAt(i)
    return self.vertexList:get(i)
end

function network.FlowNetwork:addVertexIfNotExists(v)
    if self.vertexList:contains(v) then
        return false
    else
        self.vertexList:add(v)
        self.adjList[v] = require('luagraphs.data.list').create()
        return true
    end
end

function network.FlowNetwork:removeVertex(v)
    if self.vertexList:contains(v) then
        self.vertexList:remove(v)
        self.adjList[v] = nil
    end
end

function network.FlowNetwork:containsVertex(v)
    return self.vertexList:contains(v)
end

function network.FlowNetwork:vertices()
    return self.vertexList
end

function network.FlowNetwork:addEdge(v, w, capacity)
    local e = network.FlowEdge.create(v, w, capacity)
    self.adjList[e.v]:add(e)
    self.adjList[e.w]:add(e)
end

function network.FlowNetwork:adj(v)
    return self.adjList[v]
end

function network.FlowEdge:residualCapacityTo(x)
    if x == self.v then
        return self.flow
    else
        return self.capacity - self.flow
    end
end

function network.FlowEdge:other(x)
    if x == self.v then
        return self.w
    else
        return self.v
    end


end

function network.FlowEdge:toString()
    return self.v .. ' to ' .. self.w .. ' with capacity ' .. self.capacity
end

function network.FlowEdge:addResidualFlowTo(x, inc)
    if x == self.v then
        self.flow = self.flow - inc
    else
        self.flow = self.flow + inc
    end

end

return network

