--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/7/2017
-- Time: 10:11 AM
-- To change this template use File | Settings | File Templates.
--

local EagerPrimMST = {}
EagerPrimMST.__index = EagerPrimMST

function EagerPrimMST.create()
    local s = {}
    setmetatable(s, EagerPrimMST)

    s.path = require('luagraphs.data.list').create()
    s.marked = {}

    return s
end

function EagerPrimMST:run(G)
    self.path = require('luagraphs.data.list').create()
    self.marked = {}

    for i = 0, G:vertexCount()-1 do
        local v = G:vertexAt(i)
        self.marked[v] = false
    end

    local pq = require('luagraphs.data.IndexedMinPQ').create(function(e1, e2) return e1.weight - e2.weight end)
    self:visit(G, 0, pq)

    while self.path:size() < G:vertexCount() -1 and pq:isEmpty() == false do
        local w = pq:minIndex()
        local e = pq:delMin()
        self.path:add(e)
        self:visit(G, w, pq)
    end
end

function EagerPrimMST:visit(G, v, pq)
    self.marked[v] = true
    local adj_v = G:adj(v)
    for i=0,adj_v:size()-1 do
        local e = adj_v:get(i)
        local w = e:other(v)
        if self.marked[w] == false then
            if pq:contains(w) then
                pq:decreaseKey(w, e)
            else
                pq:add(w, e)
            end
        end
    end

end

return EagerPrimMST

