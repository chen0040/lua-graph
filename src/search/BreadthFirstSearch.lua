--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 9/7/2017
-- Time: 10:35 AM
-- To change this template use File | Settings | File Templates.
--

local BreadthFirstSearch = {}
BreadthFirstSearch.__index = BreadthFirstSearch

function BreadthFirstSearch.create()
    local s = {}
    setmetatable(s, BreadthFirstSearch)

    s.marked = {}
    s.pathTo = {}
    return s
end

function BreadthFirstSearch:run(G, s)
    self.s = s

    for i = 0, G:vertexCount()-1 do
        local v = G:vertexAt(i)
        self.marked[v] = false
        self.pathTo[v] = -1
    end

    local queue = require('data.queue').create()

    queue:enqueue(s)
    while queue:isEmpty() == false do
        local v = queue:dequeue()
        self.marked[v] = true
        local adj_v = G:adj(v)
        for i = 0, adj_v:size()-1 do
            local e = adj_v:get(i)
            local w = e:other(v)
            if self.marked[w] == false then
                self.pathTo[w] = v
                queue:enqueue(w)
            end
        end

    end
end


function BreadthFirstSearch:hasPathTo(v)
    return self.marked[v]
end

function BreadthFirstSearch:getPathTo(v)
    local stack = require('data.stack')
    local path = stack.create()
    local x = v
    while x ~= self.s do
        path:push(x)
        x = self.pathTo[x]
    end
    path:push(self.s)
    return path
end


return BreadthFirstSearch
