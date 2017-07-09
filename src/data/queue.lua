--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 9/7/2017
-- Time: 10:37 AM
-- To change this template use File | Settings | File Templates.
--

local queue = {}
queue.__index = queue

queue.Node = {}
queue.Node.__index = queue.Node

function queue.Node.create(value)
    local s = {}
    setmetatable(s, queue.Node)

    s.value = value
    s.next = nil
    return s
end

function queue.create()
    local s = {}
    setmetatable(s, queue)

    s.first = nil
    s.last = nil
    s.N = 0

    return s
end

function queue:enqueue(value)
    local oldLast = self.last
    self.last = queue.Node.create(value)
    if oldLast ~= nil then
        oldLast.next = self.last
    end
    if self.first == nil then
        self.first = self.last
    end

    self.N = self.N + 1
end

function queue:dequeue()
    local oldFirst = self.first
    if oldFirst == nil then
        return nil
    end

    local value = oldFirst.value
    self.first = oldFirst.next
    self.N = self.N - 1
    if self.first == nil then
        self.last = nil
    end
    return value
end

function queue:size()
    return self.N
end

function queue:isEmpty()
    return self.N == 0
end

return queue

