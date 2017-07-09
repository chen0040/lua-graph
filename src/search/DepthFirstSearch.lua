--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 6/7/2017
-- Time: 3:06 PM
-- To change this template use File | Settings | File Templates.
--

local DepthFirstSearch = {};
DepthFirstSearch.__index = DepthFirstSearch

function DepthFirstSearch.create()
    local s = {}
    setmetatable(s, DepthFirstSearch)


    s.marked = {}
    s.pathTo = {}

    return s
end

function DepthFirstSearch:run(G, s)
    local V = G.V

    self.s = s
    for i = 0,V-1 do
        self.marked[i] = false
        self.pathTo[i] = -1
    end

    self:dfs(G, s)
end

function DepthFirstSearch:dfs(G, v)
    self.marked[v] = true
    local adj_v = G:adj(v)
    for i = 0,adj_v:size()-1 do
        local e = adj_v:get(i)
        local w = e:other(v)
        if self.marked[w] == false then
            self.pathTo[w] = v
            self:dfs(G, w)
        end
    end
end

function DepthFirstSearch:hasPathTo(v)
    return self.marked[v]
end

function DepthFirstSearch:getPathTo(v)
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

return DepthFirstSearch

