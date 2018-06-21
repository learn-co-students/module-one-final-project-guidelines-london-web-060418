def login_or_create_account(login_choice)
  if login_choice == "LOGIN"
    login
  elsif login_choice == "CREATE"
    create_account
  else
    return "Try again"
    login_choice=gets.chomp
    login_or_create_account(login_choice)
  end
end

def main_menu(x)
  puts ""
  puts ""
  puts ""
  exit_app = false
  while(!exit_app) do
    puts "What do you want to do #{x.username}? "
    puts "1. View a profile"
    puts "2. View own profile"
    puts "3. Follow a user"
    puts "4. See Your Followers"
    puts "5. See Who You Follow"
    puts "6. Post A Photo"
    puts "10. Log Out"

    puts ""
    puts ""
    

    puts "Enter an option from above"
    response = gets.chomp
    case response.to_i
    when 1
      puts "Enter a username:"
      desired = gets.chomp
      x.show_user_feed(desired)
    when 2
      x.display_feed
    when 3
      desired= gets.chomp
      x.follow_via_username(desired)
    when 4
      x.get_followers.each { |fol| puts fol.username}
    when 5
      x.get_followed.each { |fol| puts fol.username}
    when 6
      puts "Enter the direct link of an image:"
      user_image_url = gets.chomp
      x.post_via_url(user_image_url)
    when 10
      exit_app = true
      puts "See you next time!"
    end
    #   views_from_the_six
    # when 3
    #   follow
    # when 4
  end
end

def post
  puts "whaddaya wanna post yo"
end

def login
  puts "What's your username?"
  user=gets.chomp
  puts "What's your password? [look over your shoulder before typing (trust no-one)]"
  password=gets.chomp
  log_me_in(user,password)
end


def log_me_in(user,pass)
  namecall=User.find_by(username:user, password:pass)
  puts namecall.username
  namecall
  #CHANGES LOG_IN STATUs
end

def create_account
  puts"What do you want your username to be?"
  name=gets.chomp
  puts "what do you want your password to be?"
  password= gets.chomp
  User.create(username:name,password:password)
end

def run
  puts "Login (type: 'LOGIN'), or create an account(type: 'CREATE'): "
  login_choice = gets.chomp
  x=login_or_create_account(login_choice)
  main_menu(x)
end

def follow
end
