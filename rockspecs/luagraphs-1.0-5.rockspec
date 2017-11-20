package = "luagraphs"
version = "1.0-5"
source = {
   url = "git://github.com/chen0040/lua-graph.git",
   tag = "v1.0.5",
}
description = {
   summary = "Lua Graph Algorithms Library",
   detailed = [[
      Lua implementation for algorithms and data structures
      for Graph processing
   ]],
   homepage = "https://github.com/chen0040/lua-graph",
   license = "MIT/X11"
}
dependencies = {
   "lua >= 5.1, < 5.4"
}
build = {
   type = "builtin",
   modules = {
      -- Note the required Lua syntax when listing submodules as keys
      ["luagraphs.data.stack"] = "src/luagraphs/data/stack.lua",
      ["luagraphs.data.graph"] = "src/luagraphs/data/graph.lua",
      ["luagraphs.data.network"] = "src/luagraphs/data/network.lua",
      ["luagraphs.data.list"] = "src/luagraphs/data/list.lua",
      ["luagraphs.data.queue"] = "src/luagraphs/data/queue.lua",
      ["luagraphs.data.UnionFind"] = "src/luagraphs/data/UnionFind.lua",
      ["luagraphs.data.MinPQ"] = "src/luagraphs/data/MinPQ.lua",
      ["luagraphs.data.IndexedMinPQ"] = "src/luagraphs/data/IndexedMinPQ.lua",
      ["luagraphs.search.DepthFirstSearch"] = "src/luagraphs/search/DepthFirstSearch.lua",
      ["luagraphs.search.BreadthFirstSearch"] = "src/luagraphs/search/BreadthFirstSearch.lua",
      ["luagraphs.sort.TopologicalSort"] = "src/luagraphs/sort/TopologicalSort.lua",
      ["luagraphs.connectivity.ConnectedComponents"] = "src/luagraphs/connectivity/ConnectedComponents.lua",
      ["luagraphs.connectivity.StronglyConnectedComponents"] = "src/luagraphs/connectivity/StronglyConnectedComponents.lua",
      ["luagraphs.mst.KruskalMST"] = "src/luagraphs/mst/KruskalMST.lua",
      ["luagraphs.mst.PrimMST"] = "src/luagraphs/mst/PrimMST.lua",
      ["luagraphs.mst.EagerPrimMST"] = "src/luagraphs/mst/EagerPrimMST.lua",
      ["luagraphs.shortest_paths.Dijkstra"] = "src/luagraphs/shortest_paths/Dijkstra.lua",
      ["luagraphs.shortest_paths.TopoSortShortestPath"] = "src/luagraphs/shortest_paths/TopoSortShortestPath.lua",
      ["luagraphs.shortest_paths.BellmanFord"] = "src/luagraphs/shortest_paths/BellmanFord.lua",
      ["luagraphs.flow.FordFulkerson"] = "src/luagraphs/flow/FordFulkerson.lua",
   }
}
