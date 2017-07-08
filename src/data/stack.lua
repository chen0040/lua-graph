--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 8/7/2017
-- Time: 9:23 PM
-- To change this template use File | Settings | File Templates.
--

local stack = {}
stack.__index = sack

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

    return s
end

