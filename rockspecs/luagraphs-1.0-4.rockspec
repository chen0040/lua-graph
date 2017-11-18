package = "luagraphs"
version = "1.0-4"
source = {
   url = "git://github.com/chen0040/lua-graph.git",
   tag = "v1.0.4",
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
      ["luagraphs.data.stack"] = "src/data/stack.lua",
      ["luagraphs.data.graph"] = "src/data/graph.lua",
      ["luagraphs.data.network"] = "src/data/network.lua",
      ["luagraphs.data.list"] = "src/data/list.lua",
      ["luagraphs.data.queue"] = "src/data/queue.lua",
      ["luagraphs.data.UnionFind"] = "src/data/UnionFind.lua",
      ["luagraphs.data.MinPQ"] = "src/data/MinPQ.lua",
      ["luagraphs.data.IndexedMinPQ"] = "src/data/IndexedMinPQ.lua",
      ["luagraphs.search.DepthFirstSearch"] = "src/search/DepthFirstSearch.lua",
      ["luagraphs.search.BreadthFirstSearch"] = "src/search/BreadthFirstSearch.lua",
      ["luagraphs.sort.TopologicalSort"] = "src/sort/TopologicalSort.lua",
      ["luagraphs.connectivity.ConnectedComponents"] = "src/connectivity/ConnectedComponents.lua",
      ["luagraphs.connectivity.StronglyConnectedComponents"] = "src/connectivity/StronglyConnectedComponents.lua",
      ["luagraphs.mst.KruskalMST"] = "src/mst/KruskalMST.lua",
      ["luagraphs.mst.PrimMST"] = "src/mst/PrimMST.lua",
      ["luagraphs.mst.EagerPrimMST"] = "src/mst/EagerPrimMST.lua",
      ["luagraphs.shortest_paths.Dijkstra"] = "src/shortest_paths/Dijkstra.lua",
      ["luagraphs.shortest_paths.TopoSortShortestPath"] = "src/shortest_paths/TopoSortShortestPath.lua",
      ["luagraphs.shortest_paths.BellmanFord"] = "src/shortest_paths/BellmanFord.lua",
      ["luagraphs.flow.FordFulkerson"] = "src/flow/FordFulkerson.lua",
   }
}
