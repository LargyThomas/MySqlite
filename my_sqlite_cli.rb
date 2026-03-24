require "readline"
require_relative "my_sqlite_request"

# Affiche les résultats d'un SELECT : chaque ligne avec les valeurs séparées par "|"
def display_results(rows) end

#  Dispatcher principal

def execute_query(query)
  query = query.strip
  return if query.empty?

  # Le case compare la commande à des regex. \A veut dire "début de la string"  et le i à la fin rend regex insensible à la casse (SELECT = select = Select).
  case query
  when /\ASELECT/i
    request = parse_select(query)
    results = request.run
    display_results(results)

  when /\AINSERT/i
    request = parse_insert(query)
    request.run
    puts "1 row inserted."

  when /\AUPDATE/i
    request = parse_update(query)
    request.run
    puts "Rows updated."

  when /\ADELETE/i
    request = parse_delete(query)
    request.run
    puts "Rows deleted."

  else
    puts "Erreur : commande non reconnue. Utilise SELECT / INSERT / UPDATE / DELETE."
  end
end

#  Boucle principale CLI

puts "MySQLite version 0.1 2024-01-01"

while (input = Readline.readline("my_sqlite_cli> ", true))
  input = input.strip                                             # enlève les espaces/retours à la ligne autour my_strip " [la[]la] " => "la[]la"
  next if input.empty?

  break if input.downcase == "quit"

  begin                                                           # begin...rescue...end en Ruby permet de gérer les exceptions (erreurs)
    execute_query(input)
  rescue => error                                                 # exception de type StandardError et met dans error
    puts "Erreur : #{error.message}"
  end
end

puts "Bye!"