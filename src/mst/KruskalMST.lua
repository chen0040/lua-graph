--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/7/2017
-- Time: 9:29 AM
-- To change this template use File | Settings | File Templates.
--

local KruskalMST = {}
KruskalMST.__index = KruskalMST

function KruskalMST.create()
    local s = {}
    setmetatable(s, KruskalMST)

    s.marked = {}
    s.path = require('data.list').create()
    return s
end

function KruskalMST:run(G)
    self.marked = {}
    self.path = require('data.list').create()
    local pq = require('data.MinPQ').create(function(e1, e2)
        return e1.weight - e2.weight
    end)

    for v = 0, G.V-1 do
        self.marked[v] = false
    end

    local adj_s = G:adj(0)
    self.marked[0] = true
    for i = 0, adj_s:size()-1 do
        local e = adj_s:get(i)
        pq:add(e)
    end

    local uf = require('data.UnionFind').create(G.V)
    while pq:isEmpty() == false and self.path:size() < G.V - 1 do
        local e = pq:delMin()
        local v = e:either()
        local w = e:other(v)
        if uf:connected(v, w) == false then
            uf:union(v, w)
            self.path:add(e)

            if self.marked[v] == false then
                self.marked[v] = true
                local adj_v = G:adj(v)
                for i = 0, adj_v:size()-1 do
                    local e_v = adj_v:get(i)
                    pq:add(e_v)
                end
            end

            if self.marked[w] == false then
                self.marked[w] = true
                local adj_w = G:adj(w)
                for i = 0, adj_w:size()-1 do
                    local e_w = adj_w:get(i)
                    pq:add(e_w)
                end
            end
        end
    end
end

return KruskalMST

