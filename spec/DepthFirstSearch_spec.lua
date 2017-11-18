--
-- Created by IntelliJ IDEA.
-- User: chen0
-- Date: 9/7/2017
-- Time: 10:12 AM
-- To change this template use File | Settings | File Templates.
--

describe('DepthFirstSearch()', function()
    local g = require('data.graph').create(6)
    g:addEdge(0, 5);
    g:addEdge(2, 4);
    g:addEdge(2, 3);
    g:addEdge(1, 2);
    g:addEdge(0, 1);
    g:addEdge(3, 4);
    g:addEdge(3, 5);
    g:addEdge(0, 2);
    local dfs = require('search.DepthFirstSearch').create()
    local s = 0
    dfs:run(g, s)

    for i = 0, g:vertexCount()-1 do
        local v = g:vertexAt(i)
        if v ~= s and dfs:hasPathTo(v) then
            print('has path to ' .. v)
            local path = dfs:getPathTo(v)
            local pathText = ''
            while path:isEmpty() == false do
                local x = path:pop()
                if pathText == '' then
                    pathText = pathText .. x
                else
                    pathText = pathText .. ' -> ' .. x
                end
            end
            print(pathText)

        end
    end


end)

