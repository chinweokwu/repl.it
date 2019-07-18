def weighted_graphs(matrix)
  # write your code here
  weighted_hash_graph = adjacency_list(matrix)
  min_station_stops = Array.new(matrix.size, 0)
  start_node = 0
  queue = [start_node]
  visited = [start_node]

  until queue.empty?
    current_node = queue.shift
    neighbours = weighted_hash_graph[current_node]
    neighbours.each do|vertex|
      unless visited.include?(vertex)
          visited << vertex
          queue << vertex
          min_station_stops[vertex] += get_count_station_stops(neighbours, start_position)
      end
    end
  end
  min_station_stops
end

def adjacency_list(matrix)
  hash_graph =  Hash.new
  0.upto(matrix.size - 1) do |row|
    hash_graph[row] = []
    0.upto(matrix.size - 1) do |column|
      hash_graph[row] << column unless matrix[row][column].zero?
    end
  end
  hash_graph
end

def get_count_station_stops(arr_connected_nodes, start_position)
  unless arr_connected_nodes.include?(start_position)
    return 2
  end
  return 1
end

p weighted_graphs([[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]])
# => [0, 2, 1, 1, 2, 2]