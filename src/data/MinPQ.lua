--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 26/7/2017
-- Time: 10:05 AM
-- To change this template use File | Settings | File Templates.
--

local MinPQ = {}
MinPQ.__index = MinPQ

function MinPQ.create(comparator)
    local s = {}
    setmetatable(s, MinPQ)

    if comparator == nil then
        comparator = function(a1, a2) return a1 - a2 end
    end


    s.a = {}
    s.N = 0
    s.comparator = comparator
    return s
end

function MinPQ:add(item)
    self.N = self.N + 1
    self.a[self.N] = item

    self:swim(self.N)
end

function MinPQ:delMin()
    if self.N == 0 then
        return nil
    end

    local item = self.a[1]

    self:exchange(self.a, 1, self.N)
    self.N = self.N - 1
    self:sink(1)

    return item
end

function MinPQ:sink(k)
    while k * 2 <= self.N do
        local child = k * 2
        if child < self.N and self:less(self.a[child+1], self.a[child]) then
            child = child + 1
        end
        if self:less(self.a[child], self.a[k]) then
            self:exchange(self.a, child, k)
            k = child
        else
            break
        end
    end

end

function MinPQ:size()
    return self.N
end

function MinPQ:isEmpty()
    return self.N == 0
end

function MinPQ:swim(k)
    while k > 1 do
        local parent = math.floor(k / 2)
        if self:less(self.a[k], self.a[parent]) then
            self:exchange(self.a, k, parent)
        else
            break
        end
    end
end

function MinPQ:less(a1, a2)
    return self.comparator(a1, a2) < 0
end

function MinPQ:exchange(a, i, j)
    local temp = a[i]
    a[i] = a[j]
    a[j] = temp
end

return MinPQ

