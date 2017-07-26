--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/7/2017
-- Time: 9:34 AM
-- To change this template use File | Settings | File Templates.
--

local UnionFind = {}
UnionFind.__index = UnionFind

function UnionFind.create(V)
    local s = {}
    setmetatable(s, UnionFind)

    s.id = {}
    s.count = {}
    for v=0, V-1 do
        s.id[v] = v
        s.count[v] = 1
    end
    return s
end

function UnionFind:root(v)
    local x = v
    while self.id[x] ~= x do
        x = self.id[x]
        self.id[x] = self.id[self.id[x]]
    end
    return x
end

function UnionFind:union(v, w)
    local v_root = self:root(v)
    local w_root = self:root(w)

    if v_root ~= w_root then
        if self.count[v_root] > self.count[w_root] then
            self.id[w_root] = v_root
        else
            self.id[v_root] = w_root
        end
    end

end

function UnionFind:connected(v, w)
    return self:root(v) == self:root(w)
end

return UnionFind

