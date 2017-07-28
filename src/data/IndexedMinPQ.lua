--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 28/7/2017
-- Time: 9:39 AM
-- To change this template use File | Settings | File Templates.
--

local IndexedMinPQ = {}
IndexedMinPQ.__index = IndexedMinPQ

function IndexedMinPQ.create(comparator)
    local s = {}
    setmetatable(s, IndexedMinPQ)

    if comparator == nil then
        comparator = function(a1, a2) return a1 - a2 end
    end

    s.keys = {}
    s.pq = {}
    s.qp = {}
    s.N = 0
    s.comparator = comparator
    return s;
end

function IndexedMinPQ:less(a1, a2)
    return self.comparator(a1, a2) < 0
end

function IndexedMinPQ:exchange(a, i, j)
    local temp = a[i]
    a[i] = a[j]
    a[j] = temp
end

function IndexedMinPQ:add(index, key)
    self.keys[index] = key
    self.N = self.N + 1
    self.pq[self.N] = index
    self.qp[index] = self.N

    self:swim(self.N)
end

function IndexedMinPQ:swim(k)
    while k > 1 do
        local parent = math.floor(k / 2)
        if self:less(self.keys[self.pq[k]], self.keys[self.pq[parent]]) then
            self:exchange(self.pq, k, parent)
            self.qp[self.pq[k]] = k
            self.qp[self.pq[parent]] = parent
        else
            break
        end
    end

end

function IndexedMinPQ:minKey()
    return self.keys[self.pq[1]]
end

function IndexedMinPQ:minIndex()
    return self.pq[1]
end

function IndexedMinPQ:delMin()
    if self.N == 0 then
        return nil
    end

    local key = self.keys[self.pq[1]]
    self:exchange(self.pq, 1, self.N)
    self.qp[self.pq[1]]=1
    self.qp[self.pq[self.N]]= self.N
    self.N = self.N - 1

    self:sink(1)

    return key
end

function IndexedMinPQ:sink(k)
    while k * 2 <= self.N do
        local child = k * 2
        if child < self.N and self:less(self.keys[self.pq[child+1]], self.keys[self.pq[child]]) then
            child = child + 1
        end

        if self:less(self.keys[self.pq[child]], self.keys[self.pq[k]]) then
            self:exchange(self.pq, child, k)
            self.qp[self.pq[child]] = child
            self.qp[self.pq[k]] = k
        else
            break
        end
    end
end

function IndexedMinPQ:decreaseKey(index, key)
    if self:less(key, self.keys[index]) then
        local position = self.qp[index]
        self.keys[index] = key
        self:swim(position)
    end
end

function IndexedMinPQ:contains(index)
    return self.keys[index] ~= nil
end

function IndexedMinPQ:size()
    return self.N
end

function IndexedMinPQ:isEmpty()
    return self.N == 0
end

return IndexedMinPQ

