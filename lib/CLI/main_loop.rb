

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
  exit_app = false
  while(!exit_app) do
    puts "What do you want to do #{x.username}? "
    puts "1. View a profile"
    puts "2. View own profile"
    puts "3. Follow a user"
    puts "4. see the followers you have"
    puts "5. Log Out"
    response=gets.chomp
    case response.to_i
    when 1
      desired= gets.chomp
      x.show_user_feed(desired.username)
    when 2
      x.show_user_feed(x.username)
    when 3
      desired= gets.chomp
      x.follow_user_via_username(desired)
      main_menu(x)
    when 4
      x.get_followers.each { |fol| puts fol.username}
      main_menu(x)
    when 5
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


# def show_user_feed(username)
#     user_to_display = find_followed_user(username)
#     if(user_to_display) then
#       photos_of_user_array = Photo.all.select {|photo| photo.user_id = user_to_display.id}
#       currentPos = 0
#       exit_loop = false
#       while(!exit_loop) do
#         photo = photos_of_user_array[currentPos]
#         Photo.load_image(photo) #Loads the image into the temrinal and loads the photos comments.
#         puts "Commands: like, comment, next, previous, exit"
#         input = STDIN.gets.chomp
#         case input
#           when "comment"
#             comment = STDIN.gets.chomp
#             add_comment_to_photo(photo, comment)
#             Photo.load_image(photo)
#           when "like"
#             add_like_photo(photo)
#             Photo.load_image(photo)
#           when "next"
#             currentPos+=1
#           when "previous"
#             currentPos-=1
#           when "exit"
#             exit_loop = true
#           else
#             puts "Wrong Function: Try Again"
#           end
#       end
#     else
#       puts "user not found / followed"
#     end
#   end


def follow
end
