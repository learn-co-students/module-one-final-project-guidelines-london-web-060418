#MAIN MENU
def display_image
  puts "                     \\     /"
  puts "                     \\\\   //"
  puts "                      )\\-/("
  puts "                      /e e\\ "
  puts "                     ( =Y= )"
  puts "                     /`-!-'\\ "
  puts "        ___\\ \\      /       \\"
  puts " \\   /    ```  --```~~\"--.,__\\"
  puts " `-._\\ /                       `~~\"--.,_"
  puts " ----->|                                `~~\"--.,_"
  puts " _.-'/ \\                                         ~~\"--.,_"
  puts "     \\_________________________,,,,....----\"\"\"\"~~~~````"
end

def main_menu
  display_image
  puts "\n  How can I help you:"
  puts "\n             1 . Generate New Recipe"
  puts "             2 . Browse Recipe Book"
  puts "                   3 . Help"
  puts "                   4 . Exit"
end

#1 - RECIPE GENERATOR
def generate_recipe
  recipe = Recipe.create
  display_recipe(recipe)
  puts "\nWould you like to add this recipe to your Recipe Book? (Y/N)"
  loop do
    input = gets.strip.downcase

    if input == "y" || input == "yes"
      # PersonalRecipe.create(recipe)
      puts " - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
      puts "\n  The recipe has been added to your Recipe Book!\n"
      puts " - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
      break
    elsif input == "n" || input == "no"
      puts "\nBon appetit!\n"
      break
    else
      puts "I'm sorry, but I need a 'Yes'('Y') or a 'No'('N')"
    end
  end
end

def display_recipe(recipe)
  instructions = JSON.parse(recipe.instructions)
  ingredients = recipe.ingredients
  puts "        - - - PLACEHOLDER - - -"
  puts "\n  INGREDIENTS:\n"
  ingredients.each do |ing|
    puts "o #{ing.name}"
  end
  puts "\n  INSTRUCTIONS:\n"
  instructions.each do |step, instruction|
    puts "#{step} - #{instruction}"
  end
end

#2 - RECIPE BOOK
def recipe_book

end

#3 - HELP INFORMATION
def help_info
  puts "\nHelp - Shows information about commands"
  puts "\n1 . Generate New Recipe"
  puts "      Creates a new recipe using random ingredients."
  puts "      This recipe can then be saved to your Recipe Book."
  puts "\n2 . Browse Recipe Book"
  puts "      Browse your collection of saved recipes."
  puts "\n4 . Exit"
  puts "      Exit the program, discarding any unsaved recipes."
end

#RUN PROGRAM
def run
  puts "\nWelcome User! I'll be your Recipe Rabbit for today!\n\n"
  main_menu
  loop do
    puts "\nEnter the number or the first word of a command:"
    input = gets.strip.downcase
    case input

    when "1", "generate" then
      generate_recipe
      main_menu

    when "2", "browse" then recipe_book

    when "3", "help" then help_info

    when "4", "exit" then
      puts "\n Catch you later, doc!\n\n"
      break

    else
      puts "Invalid command. Please try again."
    end
  end
end
