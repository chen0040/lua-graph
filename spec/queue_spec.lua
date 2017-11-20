--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 9/7/2017
-- Time: 10:41 AM
-- To change this template use File | Settings | File Templates.
--

describe('queue()', function()
    it('should enqueue and dequeue', function()
        local queue = require('luagraphs.data.queue').create()
        queue:enqueue(10)
        queue:enqueue(30)
        queue:enqueue(20)
        queue:enqueue(40)

        assert.equal(queue:size(), 4)
        assert.equal(queue:isEmpty(), false)
        assert.equal(queue:dequeue(), 10)
        assert.equal(queue:dequeue(), 30)
        assert.equal(queue:dequeue(), 20)
        assert.equal(queue:dequeue(), 40)
        assert.equal(queue:isEmpty(), true)
    end)
end)

