def display_image
  puts " \\     /"
  puts " \\\\   //"
  puts "  )\\-/("
  puts "  /e e\\ "
  puts " ( =Y= )"
  puts " /`-!-'\\ "
  puts " ____/ /___\\ \\ "
  puts " \\   /    ```    ```~~\"--.,_"
  puts " `-._\\ /                       `~~\"--.,_"
  puts " ----->|                                `~~\"--.,_"
  puts " _.-'/ \\                                         ~~\"--.,_"
  puts "     \\_________________________,,,,....----\"\"\"\"~~~~````"
end

def main_prompt
  display_image
  puts "\nHow can I help you today:"
  puts "      1 . Generate New Recipe"
  puts "      2 . Browse Recipe Book"
  puts "          3 . Help"
  puts "          4 . Exit"
end

def generate_recipe

end

def recipe_book

end

def help_info
  puts "Help - Shows information about commands"
  puts "1 . Generate New Recipe"
  puts "      Creates a new recipe using random ingredients."
  puts "      This recipe can then be saved to your Recipe Book."
  puts "2 . Browse Recipe Book"
  puts "      Browse your collection of saved recipes."
  puts "4 . Exit"
  puts "      Exit the program, discarding any unsaved recipes."
end

def exit_program
  puts "Catch you later, doc!"
end

def run
  puts "Welcome User! I'll be your recipe rabbit today!"
  main_prompt
  loop do
    puts "\nPlease enter the number or the first word of a command:"
    input = gets.strip.downcase
    case input
    when "1" || "generate" then generate_recipe
    when "2" || "browse" then recipe_book
    when "3" || "help" then help_info
    when "4" || "exit" then
      exit_program
      break
    else
      puts "Invalid command. Try again."
    end
  end
end
