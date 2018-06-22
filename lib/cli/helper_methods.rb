#LOGIN MENU
def start_menu
  puts "\n                1. Login"
  puts "               2. Sign up"
  puts "                3. Exit\n"
end

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
  puts "\n  How can I help you:"
  puts "\n             1. Generate New Recipe"
  puts "             2. Browse Recipe Book"
  puts "                   3. Help"
  puts "                   4. Exit"
end

#1 - RECIPE GENERATOR
def generate_recipe(user)
  recipe = Recipe.create
  display_recipe(recipe)
  puts "\nWould you like to add this recipe to your Recipe Book? (Y/N)"
  loop do
    input = gets.strip.downcase

    if input == "y" || input == "yes"
      PersonalRecipe.create(template_recipe_id: recipe.template_recipe_id, user_id: user.id)
      puts "   - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
      puts "      The recipe has been added to your Recipe Book!\n"
      puts "   - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
      break
    elsif input == "n" || input == "no"
      puts "\nBon appetit!\n"
      break
    else
      puts "I'm sorry, but I need a 'Yes'('Y') or a 'No'('N')"
    end
  end
end


#Calculate quantity based on user input for amount of portions

def get_portions(ingredients, num_of_portions)
  ingredients_quantities = ingredients.map do |ingredient|
    quantity = (ingredient.quantity.to_i / 3 * num_of_portions.to_i).to_s
    unit = ingredient.serving_unit
    "#{quantity} #{unit}(s)"
  end
  ingredients_quantities
end

def prompt_for_portions
  loop do
    puts "How many people are you cooking for?"
    input = gets.strip
    if ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].include?(input)
      return input
    else
      puts " Invalid command. Please try again."
    end
  end
end

def display_recipe(recipe)
  instructions = JSON.parse(recipe.instructions)
  ingredients = recipe.ingredients
  num_of_portions = prompt_for_portions
  ingredient_quantity = get_portions(ingredients, num_of_portions)
  nutrition = NutritionFact.find_by(recipe_id: recipe.id)
  puts "        - - - #{recipe.name} - - -"
  puts "\n  INGREDIENTS:\n"
  ingredients.each do |ing|
    i = ingredients.index(ing)
    puts "o #{ing.name} #{ingredient_quantity[i]}"
  end
  puts "\n  INSTRUCTIONS:\n"
  instructions.each do |step, instruction|
    puts "#{step} - #{instruction}"
  end
  puts "\n  NUTRITIONAL FACTS:"
  print " Carbohydates: #{nutrition[:carbs]}g -"
  print " Protein: #{nutrition[:protein]}g -"
  puts " Fats: #{nutrition[:fat]}g"
end

#2 - RECIPE BOOK
def recipe_book(user)
  book = PersonalRecipe.all.select do |p_r|
    p_r.user == user
  end
  loop do
    puts "\n~ ~ ~ ~ ~ ~ RECIPE BOOK ~ ~ ~ ~ ~ ~\n\n"
    book.each_with_index do |recipe, index|
      puts " #{index + 1}. #{recipe.name}"
    end
    puts " 0. Close Recipe Book"
    puts "\n Enter the NUMBER for the recipe you'd like to see:"
    input = gets.strip.to_i
    recipe = book[input - 1]

    if input == 0
      break

    elsif input <= book.length
      display_recipe(recipe)
      puts "\n What would you like to do with this recipe?"
      puts " 1. Edit recipe's name"
      puts " 2. Remove recipe from Recipe Book"
      puts " 3. Go back to Recipe Book"
      puts " 4. Return to Main Menu"
      puts "\nEnter the number or the first word of a command:"
      input2 = gets.strip.downcase

      case input2
      when "1", "edit" then
        puts "Current recipe name: #{recipe.name}"
        print "New recipe name: "
        recipe.name = gets.strip
        recipe.save
      when "2", "remove" then
        recipe.destroy
        book = PersonalRecipe.all.select do |p_r|
          p_r.user == user
        end
      when "3", "go" then
        recipe_book(user)
        break
      when "4", "return" then
        break
      else
        puts "Invalid command. Please try again."
      end
    else
      puts " Please enter a number between 0 and #{book.length}."
      recipe_book(user)
      break
    end
  end
end

#3 - HELP INFORMATION
def help_info
  puts "\n Help - Shows information about commands"
  puts "\n 1 . Generate New Recipe"
  puts "       Creates a new recipe using random ingredients."
  puts "       This recipe can then be saved to your Recipe Book."
  puts "\n 2 . Browse Recipe Book"
  puts "       Browse your collection of saved recipes."
  puts "\n 4 . Exit"
  puts "       Exit the program, discarding any unsaved recipes."
end

#RUN PROGRAM
def run
  puts "\n\n/\\/\\/\\/\\/\\ - VEGAN GENERATOR - /\\/\\/\\/\\/\\"
  user = nil
  loop do
    start_menu
    puts "\nEnter a command or number:"
    input = gets.strip.downcase
    case input

    when "1", "login"
      puts "\n      L O G I N\n\n"
      print " Username: "
      username = gets.strip

      if User.find_by(username: username)
        print " Password: "
        password = gets.strip

        if User.find_by(username: username).password == password
          user = User.find_by(username: username)
          break
        else
          puts "   - - - - - - - - - - - - - - - - - -"
          puts "   - X - X - Wrong password - X - X -"
          puts "   - - - - - - - - - - - - - - - - - -"
        end

      else
        puts "   - - - - - - - - - - - - - - - - - - - - - - - -"
        puts "   - X - X - That account doesn't exist - X - X -"
        puts "   - - - - - - - - - - - - - - - - - - - - - - - -"
      end

    when "2", "sign up"
      puts "\n      S I G N   U P\n\n"
      print " Username: "
      username = gets.strip

      if User.find_by(username: username)
        puts "\n - X - X - This account already exists - X - X -\n"
      elsif username.empty?
        puts "\n Username must have at least 1 character"
      else
        print " Password: "
        password = gets.strip
        User.create(username: username, password: password)
        puts "\n   - - - - - - - - - - - - - - - -"
        puts "   New account succesfully created"
        puts "   - - - - - - - - - - - - - - - -\n"
      end

    when "3", "exit"
      puts "      Goodbye!\n"
      break
    else
      puts "Invalid command. Please try again."
    end
  end

  if user != nil
    puts "\nWelcome User! I'll be your Recipe Rabbit for today!\n\n"
    display_image
    loop do
      main_menu
      puts "\nEnter the number or the first word of a command:"
      input = gets.strip.downcase
      case input

      when "1", "generate" then

        generate_recipe(user)

      when "2", "browse" then recipe_book(user)

      when "3", "help" then help_info

      when "4", "exit" then
        puts "\n Catch you later, doc!\n\n"
        break

      else
        puts "Invalid command. Please try again."
      end
    end
  end
end
