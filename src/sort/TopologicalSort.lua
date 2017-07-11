--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 11/7/2017
-- Time: 8:42 AM
-- To change this template use File | Settings | File Templates.
--

local TopologicalSort = {}
TopologicalSort.__index = TopologicalSort

function TopologicalSort.create()
    local s = {}
    setmetatable(s, TopologicalSort)

    s.reversedPostOrder = require('data.stack').create()
    s.marked = {}

    return s
end

function TopologicalSort:run(G)
    local V = G.V

    for v = 0,V-1 do
        self.marked[v] = false
    end

    for v = 0, V-1 do
        if self.marked[v] == false then
            self:dfs(G, v)
        end
    end
end

function TopologicalSort:dfs(G, v)
    self.marked[v] = true

    local adj_v = G:adj(v)

    for i = 0, adj_v:size()-1 do
        local e = adj_v:get(i)
        local w = e:other(v)
        if self.marked[w] == false then
            self:dfs(G, w)
        end
    end


    self.reversedPostOrder:push(v)
end

function TopologicalSort:path()
    return self.reversedPostOrder:toList()
end

return TopologicalSort

