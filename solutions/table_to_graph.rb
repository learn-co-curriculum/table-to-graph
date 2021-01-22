def table_to_graph(friends)
  data = friends.split(/<td>(\w*)<\/td>/)[1..-1]
  graph = Hash.new { |h, k| h[k] = [] }
  idx = 0

  while idx < data.length - 1
    friends_list = data[idx + 1][/<td>(.*?)<\/td>/m, 1].split(", ")
    vertex = data[idx]
    graph[vertex] = friends_list

    friends_list.each do |friend| 
      graph[friend] << vertex unless graph[friend].include?(vertex)
    end

    idx += 2
  end

  graph
end

if __FILE__ == $PROGRAM_NAME
  friends = "<table><tr><th>Person</th><th>Friends</th></tr><tr><td>Fred</td><td>Jane, Carol, Anesh, Xi</td></tr><tr><td>Carol</td><td>Fred, Anesh, Janelle</td></tr></table>"
  result = {
    "Fred" => ["Jane", "Carol", "Anesh", "Xi"],
    "Jane" => ["Fred"],
    "Carol" => ["Fred", "Anesh", "Janelle"],
    "Anesh" => ["Fred", "Carol"],
    "Xi" => ["Fred"],
    "Janelle" => ["Carol"]
  }

  puts "Expecting: #{result}"
  puts table_to_graph(friends)

  puts

  # Don't forget to add your own!
end

# Please add your pseudocode to this file
# And a written explanation of your solution
