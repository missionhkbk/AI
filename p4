class Graph:
    def __init__(self, graph, heuristicNodeList, startNode):
        self.graph = graph
        self.heuristicNodeList = heuristicNodeList
        self.startNode = startNode
    def ao_star_search(self):
        open_set = [(self.startNode, 0)] 
        closed_set = set()
        while open_set:
            current_node, current_cost = open_set.pop(0)
            if current_node in closed_set:
                continue
            closed_set.add(current_node)
            if current_node == goal_node:
                return current_cost
            for neighbor, edge_cost in self.graph[current_node]:
                if neighbor not in closed_set:
                    f_value = current_cost + edge_cost + self.heuristicNodeList[neighbor]
                    open_set.append((neighbor, f_value))
        return float('inf') # No path found
adjacency_list = {
    'A': [('B', 1), ('C', 3), ('D', 7)],
    'B': [('D', 5)],
    'C': [('D', 12)]
}
heuristics = {'A': 1, 'B': 5, 'C': 2, 'D': 4} 
start_node = 'A'
goal_node = 'D'
graph = Graph(adjacency_list, heuristics, start_node)
result = graph.ao_star_search()
if result != float('inf'):
    print(f"Optimal path cost from {start_node} to {goal_node}: {result}")
else:
    print("No path found.")
