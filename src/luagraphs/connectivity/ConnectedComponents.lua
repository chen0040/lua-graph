--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 11/7/2017
-- Time: 8:28 AM
-- To change this template use File | Settings | File Templates.
--

local ConnectedComponents = {}
ConnectedComponents.__index = ConnectedComponents

function ConnectedComponents.create()
    local s = {}
    setmetatable(s, ConnectedComponents)

    s.marked = {}
    s.count = 0
    s.id = {}

    return s
end

function ConnectedComponents:run(G)

    self.marked = {}
    self.id = {}
    for i = 0, G:vertexCount()-1 do
        local v = G:vertexAt(i)
        self.marked[v] = false
        self.id[v] = -1
    end

    self.count = 0
    for i = 0, G:vertexCount()-1 do
        local v = G:vertexAt(i)
        if self.marked[v] == false then
            self:dfs(G, v)
            self.count = self.count + 1
        end
    end

end

function ConnectedComponents:dfs(G, v)
    self.marked[v] = true
    self.id[v] = self.count

    local adj_v = G:adj(v)
    for i = 0,adj_v:size()-1 do
        local e = adj_v:get(i)
        local w = e:other(v)
        if self.marked[w] == false then
            self:dfs(G, w)
        end
    end

end

function ConnectedComponents:component(v)
    return self.id[v]
end

return ConnectedComponents

