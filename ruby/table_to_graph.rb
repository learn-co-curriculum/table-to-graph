def table_to_graph(friends)
  # type your code in here
end

if __FILE__ == $PROGRAM_NAME
  friends = "<table><tr><th>Person</th><th>Friends</th></tr><tr><td>Fred</td><td>Jane, Carol, Anesh, Xi</td></tr><tr><td>Carol</td><td>Fred, Anesh, Janelle</td></tr></table>"
  result = {
    Fred: [:Jane, :Carol, :Anesh, :Xi],
    Jane: [:Fred],
    Carol: [:Fred, :Anesh, :Janelle],
    Anesh: [:Fred, :Carol],
    Xi: [:Fred],
    Janelle: [:Carol]
  }

  puts "Expecting: #{result}"
  puts table_to_graph(friends)

  puts

  # Don't forget to add your own!
end

# Please add your pseudocode to this file
# And a written explanation of your solution
