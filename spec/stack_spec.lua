--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 8/7/2017
-- Time: 9:47 PM
-- To change this template use File | Settings | File Templates.
--

describe("stack()", function()
    it("should push and pop correctly", function()
        local stack = require('luagraphs.data.stack')
        local s = stack.create()

        s:push(10)
        s:push(9)
        s:push(13)
        s:push(14)

        assert.equal(s:size(), 4)
    end)
end)

