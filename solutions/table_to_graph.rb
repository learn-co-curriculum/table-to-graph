def table_to_graph(friends)
  data_string = friends[55..-19].gsub(/<\/tr><tr>/, "")
  data = data_string.split("</td><td>")
  graph = Hash.new { |h, k| h[k] = [] }
  idx = 0

  while idx < data.length
    friends_list = (data[idx + 1] || "").split(", ")
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
  def print_results(hash)
    hash.each { |key, val| puts "#{key}: #{val}" }
  end

  friends = "<table><tr><th>Person</th><th>Friends</th></tr><tr><td>Fred</td><td>Jane, Carol, Anesh, Xi</td></tr><tr><td>Carol</td><td>Fred, Anesh, Janelle</td></tr></table>"
  result = {
    "Fred" => ["Jane", "Carol", "Anesh", "Xi"],
    "Jane" => ["Fred"],
    "Carol" => ["Fred", "Anesh", "Janelle"],
    "Anesh" => ["Fred", "Carol"],
    "Xi" => ["Fred"],
    "Janelle" => ["Carol"]
  }

  puts "Expecting: "
  print_results(result)
  puts
  puts "Got: "
  print_results(table_to_graph(friends))

  puts

  friends = "<table><tr><th>Person</th><th>Friends</th></tr><tr><td>Gremlin</td><td>Jambaby, Carbonara, Hamtaro, Crain</td></tr><tr><td>Bats</td><td>Custard, Colonel</td></tr><tr><td>Malteser</td><td>Jambaby, Hamtaro, Bartelby, Viper</td></tr><tr><td>Viper</td><td>Malteser, Munchkin, Baconini, Bartelby</td></tr></table>"
  result = {
    "Gremlin": ["Jambaby", "Carbonara", "Hamtaro", "Crain"],
    "Jambaby": ["Gremlin", "Malteser"],
    "Carbonara": ["Gremlin"],
    "Hamtaro": ["Gremlin", "Malteser"],
    "Crain": ["Gremlin"],
    "Bats": ["Custard", "Colonel"],
    "Custard": ["Bats"],
    "Colonel": ["Bats"],
    "Malteser": ["Jambaby", "Hamtaro", "Bartelby", "Viper"],
    "Bartelby": ["Malteser", "Viper"],
    "Viper": ["Malteser", "Munchkin", "Baconini", "Bartelby"],
    "Munchkin": ["Viper"],
    "Baconini": ["Viper"]
  }

  puts "Expecting: "
  print_results(result)
  puts
  puts "Got: "
  print_results(table_to_graph(friends))

  puts

  friends = "<table><tr><th>Person</th><th>Friends</th></tr><tr><td>Gremlin</td><td>Jambaby</td></tr></table>"
  result = {
    "Gremlin": ["Jambaby"],
    "Jambaby": ["Gremlin"]
  }

  puts "Expecting: "
  print_results(result)
  puts
  puts "Got: "
  print_results(table_to_graph(friends))

  puts

  friends = "<table><tr><th>Person</th><th>Friends</th></tr><tr><td>Gremlin</td><td></td></tr></table>"
  result = {
    "Gremlin": []
  }

  puts "Expecting: "
  print_results(result)
  puts
  puts "Got: "
  print_results(table_to_graph(friends))

  puts
end

# Please add your pseudocode to this file
# And a written explanation of your solution
