# lua-graph

Graph algorithms in lua

# Features

The graph algorithms covered:

* Graph data structure (directed / undirected / weighted / unweighted)
* Depth first search
* Breadth first search
* Connected components 
* Strongly connected components
* Topological sort
* Minimum spanning tree (Kruskal)
* Minimum spanning tree (Prim)
* Max flow min cut (Coming Soon)
* Dijkstra shortest paths
* Topogical sort shortest paths (Coming Soon)
* Bellman Ford shortest paths (Coming Soon)

# Install

```bash
luarocks install luagraphs
```

# Usage

### Create an undirected unweighted graph

```lua
local g = require('luagraphs.data.graph').create(6)
g:addEdge(0, 5) -- bidirectional edge connecting 0 and 5
g:addEdge(2, 4)
g:addEdge(2, 3)
g:addEdge(1, 2)
g:addEdge(0, 1)
g:addEdge(3, 4)
g:addEdge(3, 5)
g:addEdge(0, 2)

print(g.V) -- return 6

-- code below prints the adjacency list 
for v = 0, g.V -1 do -- vertex starting at 0 and ending at g.V - 1
    local adj_v = g:adj(v) -- adjacency list for vertex v
    local text = ''
    for i = 0, adj_v:size()-1 do
        text = text .. ', ' .. adj_v:get(i):other(v)
    end
    print(text)
end
```

### Create an directed unweighted graph

```lua
local g = require('luagraphs.data.graph').create(6, true) -- true means it is directed
g:addEdge(0, 5) -- edge directed from 0 to 5
g:addEdge(2, 4)
g:addEdge(2, 3)
g:addEdge(1, 2)
g:addEdge(0, 1)
g:addEdge(3, 4)
g:addEdge(3, 5)
g:addEdge(0, 2)

print(g.V) -- return 6

-- code below prints the adjacency list 
for v = 0, g.V -1 do -- vertex starting at 0 and ending at g.V - 1
    local adj_v = g:adj(v) -- adjacency list for vertex v
    local text = ''
    for i = 0, adj_v:size()-1 do
        local e = adj_v:get(i)
        text = text .. ', ' .. e:other(v)
    end
    print(text)
end
```

### Create an undirected weighted graph

```lua
local g = require('luagraphs.data.graph').create(6)
g:addEdge(0, 5, 1.2) -- bidirectional edge with weight equal to 1.2 and connecting between 0 and 5
g:addEdge(2, 4, 2.2)
g:addEdge(2, 3, 1.2)
g:addEdge(1, 2, 1.2)
g:addEdge(0, 1, 2.2)
g:addEdge(3, 4, 1.2)
g:addEdge(3, 5, 2.2)
g:addEdge(0, 2, 2.2)

print(g.V) -- return 6

-- code below prints the adjacency list 
for v = 0, g.V -1 do -- vertex starting at 0 and ending at g.V - 1
    local adj_v = g:adj(v) -- adjacency list for vertex v
    local text = ''
    for i = 0, adj_v:size()-1 do
        local e = adj_v:get(i)
        text = text .. ', ' .. e:other(v) .. '(' .. e.weight .. ')' 
    end
    print(text)
end
```

### Create an directed weighted graph

```lua
local g = require('luagraphs.data.graph').create(6, true) -- true means directed
g:addEdge(0, 5, 1.2) -- bidirectional edge with weight equal to 1.2 and connecting between 0 and 5
g:addEdge(2, 4, 2.2)
g:addEdge(2, 3, 1.2)
g:addEdge(1, 2, 1.2)
g:addEdge(0, 1, 2.2)
g:addEdge(3, 4, 1.2)
g:addEdge(3, 5, 2.2)
g:addEdge(0, 2, 2.2)

print(g.V) -- return 6

-- code below prints the adjacency list 
for v = 0, g.V -1 do -- vertex starting at 0 and ending at g.V - 1
    local adj_v = g:adj(v) -- adjacency list for vertex v
    local text = ''
    for i = 0, adj_v:size()-1 do
        local e = adj_v:get(i)
        text = text .. ', ' .. e:other(v) .. '(' .. e.weight .. ')' 
    end
    print(text)
end
```

### Depth First Search

```lua
local g = require('luagraphs.data.graph').create(6)
g:addEdge(0, 5)
g:addEdge(2, 4)
g:addEdge(2, 3)
g:addEdge(1, 2)
g:addEdge(0, 1)
g:addEdge(3, 4)
g:addEdge(3, 5)
g:addEdge(0, 2)
local dfs = require('luagraphs.search.DepthFirstSearch').create()
local s = 0
dfs:run(g, s)

for v = 0, g.V-1 do
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
```

### Breadth First Search

```lua
local g = require('luagraphs.data.graph').create(6) 
g:addEdge(0, 5)
g:addEdge(2, 4)
g:addEdge(2, 3)
g:addEdge(1, 2)
g:addEdge(0, 1)
g:addEdge(3, 4)
g:addEdge(3, 5)
g:addEdge(0, 2)
local bfs = require('luagraphs.search.BreadthFirstSearch').create()
local s = 0
bfs:run(g, s)

for v = 0, g.V-1 do
    if v ~= s and bfs:hasPathTo(v) then
        local path = bfs:getPathTo(v)
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
```

### Connected Components

```lua
local g = require('luagraphs.data.graph').create(13) -- undirected graph
g:addEdge(0, 5)
g:addEdge(4, 3)
g:addEdge(0, 1)
g:addEdge(9, 12)
g:addEdge(6, 4)
g:addEdge(5, 4)
g:addEdge(0, 2)
g:addEdge(11, 12)
g:addEdge(9,10)
g:addEdge(0, 6)
g:addEdge(7, 8)
g:addEdge(9, 11)
g:addEdge(5, 3)

local cc = require('connectivity.ConnectedComponents').create()
cc:run(g)

print('count: ' .. cc.count)
print(cc.count) -- return 3 connected components
for v = 0,g.V-1 do
    print('id[' .. v .. ']: ' .. cc:component(v))
end
```

### Strongly Connected Components

```lua
local graph = require('luagraphs.data.graph').create(13, true) -- directed graph
graph:addEdge(4, 2)
graph:addEdge(2, 3)
graph:addEdge(3, 2)
graph:addEdge(6, 0)
graph:addEdge(0, 1)
graph:addEdge(2, 0)
graph:addEdge(11, 12)
graph:addEdge(12, 9)
graph:addEdge(9, 10)
graph:addEdge(9, 11)
graph:addEdge(8, 9)
graph:addEdge(10, 12)
graph:addEdge(11, 4)
graph:addEdge(4, 3)
graph:addEdge(3, 5)
graph:addEdge(7, 8)
graph:addEdge(8, 7)
graph:addEdge(5, 4)
graph:addEdge(0, 5)
graph:addEdge(6, 4)
graph:addEdge(6, 9)
graph:addEdge(7, 6)

local scc = require('connectivity.StronglyConnectedComponents').create()
scc:run(graph)
print(scc.count) -- return 5 components

for v = 0,graph.V-1 do
    print('id[' .. v .. ']: ' .. scc:component(v))
end
```

### Topological Sort

```lua
local dag = require('luagraphs.data.graph').create(7, true) -- directed acyclic graph

dag:addEdge(0, 5)
dag:addEdge(0, 2)
dag:addEdge(0, 1)
dag:addEdge(3, 6)
dag:addEdge(3, 5)
dag:addEdge(3, 4)
dag:addEdge(5, 4)
dag:addEdge(6, 4)
dag:addEdge(6, 0)
dag:addEdge(3, 2)
dag:addEdge(1, 4)

local ts = require('luagraphs.sort.TopologicalSort').create()
ts:run(dag)

local path = ts:path()
for i=0, path:size()-1 do
    print('sort #' .. i .. ': ' .. path:get(i))
end
```

### Minimum Spanning Tree (Kruskal)

```lua
local mst = require('luagraphs.mst.KruskalMST').create() 
local g = require('luagraphs.data.graph').create(8) -- undirected graph with weighted edges
g:addEdge(0, 7, 0.16) -- 0.16 is the weight of the edge between 0 and 7
g:addEdge(2, 3, 0.17)
g:addEdge(1, 7, 0.19)
g:addEdge(0, 2, 0.26)
g:addEdge(5, 7, 0.28)
g:addEdge(1, 3, 0.29)
g:addEdge(1, 5, 0.32)
g:addEdge(2, 7, 0.34)
g:addEdge(4, 5, 0.35)
g:addEdge(1, 2, 0.36)
g:addEdge(4, 7, 0.37)
g:addEdge(0, 4, 0.38)
g:addEdge(6, 2, 0.4)
g:addEdge(3, 6, 0.52)
g:addEdge(6, 0, 0.58)
g:addEdge(6, 4, 0.93)

mst:run(g)

local path = mst.path

print(path:size()) -- return 7
for i=0,path:size()-1 do
    local e = path:get(i)
    print(e:from() .. ' -> ' .. e:to() .. ' (' .. e.weight .. ')')
end
```

### Minimum Spanning Tree (Prim)

```lua
local mst = require('luagraphs.mst.PrimMST').create()
local g = require('luagraphs.data.graph').create(8) -- undirected graph with weighted edges
g:addEdge(0, 7, 0.16) -- 0.16 is the weight of the edge between 0 and 7
g:addEdge(2, 3, 0.17)
g:addEdge(1, 7, 0.19)
g:addEdge(0, 2, 0.26)
g:addEdge(5, 7, 0.28)
g:addEdge(1, 3, 0.29)
g:addEdge(1, 5, 0.32)
g:addEdge(2, 7, 0.34)
g:addEdge(4, 5, 0.35)
g:addEdge(1, 2, 0.36)
g:addEdge(4, 7, 0.37)
g:addEdge(0, 4, 0.38)
g:addEdge(6, 2, 0.4)
g:addEdge(3, 6, 0.52)
g:addEdge(6, 0, 0.58)
g:addEdge(6, 4, 0.93)

mst:run(g)

local path = mst.path

print(path:size()) -- return 7
for i=0,path:size()-1 do
    local e = path:get(i)
    print(e:from() .. ' -> ' .. e:to() .. ' (' .. e.weight .. ')')
end
```

### Minimum Spanning Tree (Eager Prim)

```lua
local mst = require('luagraphs.mst.EagerPrimMST').create()
local g = require('luagraphs.data.graph').create(8) -- undirected graph with weighted edges
g:addEdge(0, 7, 0.16) -- 0.16 is the weight of the edge between 0 and 7
g:addEdge(2, 3, 0.17)
g:addEdge(1, 7, 0.19)
g:addEdge(0, 2, 0.26)
g:addEdge(5, 7, 0.28)
g:addEdge(1, 3, 0.29)
g:addEdge(1, 5, 0.32)
g:addEdge(2, 7, 0.34)
g:addEdge(4, 5, 0.35)
g:addEdge(1, 2, 0.36)
g:addEdge(4, 7, 0.37)
g:addEdge(0, 4, 0.38)
g:addEdge(6, 2, 0.4)
g:addEdge(3, 6, 0.52)
g:addEdge(6, 0, 0.58)
g:addEdge(6, 4, 0.93)

mst:run(g)

local path = mst.path

print(path:size()) -- return 7
for i=0,path:size()-1 do
    local e = path:get(i)
    print(e:from() .. ' -> ' .. e:to() .. ' (' .. e.weight .. ')')
end
```

### Shortest Paths (Dijkstra)

```lua
local g = require('luagraphs.data.graph').create(8, true); -- directed weighted graph

g:addEdge(0, 1, 5.0) -- edge from 0 to 1 is 5.0 in distance
g:addEdge(0, 4, 9.0)
g:addEdge(0, 7, 8.0)
g:addEdge(1, 2, 12.0)
g:addEdge(1, 3, 15.0)
g:addEdge(1, 7, 4.0)
g:addEdge(2, 3, 3.0)
g:addEdge(2, 6, 11.0)
g:addEdge(3, 6, 9.0)
g:addEdge(4, 5, 5.0)
g:addEdge(4, 6, 20.0)
g:addEdge(4, 7, 5.0)
g:addEdge(5, 2, 1.0)
g:addEdge(5, 6, 13.0)
g:addEdge(7, 5, 6.0)
g:addEdge(7, 2, 7.0)

local dijkstra = require('luagraphs.shortest_paths.Dijkstra').create()
dijkstra:run(g, 0) -- 0 is the source node in the path search
for v = 1,g.V-1 do
    if dijkstra:hasPathTo(v) then
        print('path from 0 to ' .. v .. ' ( cost: '  .. dijkstra:getPathLength(v) .. ' )')
        local path = dijkstra:getPathTo(v)
        for i = 0,path:size()-1 do
            print('# from ' .. path:get(i):from() .. ' to ' .. path:get(i):to() .. ' ( distance: ' .. path:get(i).weight .. ' )')
        end
    end
end
```
