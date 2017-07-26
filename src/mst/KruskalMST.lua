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

    return s
end

function KruskalMST:run(G)

end

