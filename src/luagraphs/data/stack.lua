--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 8/7/2017
-- Time: 9:23 PM
-- To change this template use File | Settings | File Templates.
--

local stack = {}
stack.__index = stack

stack.Node = {}
stack.Node.__index = stack.Node

function stack.Node.create(value)
    local s = {}
    setmetatable(s, stack.Node)

    s.value = value
    s.next = nil

    return s
end

function stack.create()
    local s = {};
    setmetatable(s, stack)

    s.first = nil
    s.N = 0

    return s
end

function stack:push(val)
    local oldFirst = self.first
    self.first = stack.Node.create(val)
    self.first.next = oldFirst
    self.N = self.N + 1
end

function stack:size()
    return self.N
end

function stack:isEmpty()
    return self.N == 0
end

function stack:pop()
    if self.N == 0 then
        return nil
    end

    self.N = self.N - 1

    local oldFirst = self.first

    local val = oldFirst.value
    self.first = oldFirst.next

    return val
end

function stack:toList()
    local result = require('luagraphs.data.list').create()
    local x = self.first
    while x ~= nil do
        result:add(x.value)
        x = x.next
    end
    return result
end

return stack
