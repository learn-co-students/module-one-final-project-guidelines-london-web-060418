require 'terminal-table'

PROMPT = TTY::Prompt.new

def login_or_create_account(login_choice)
  if login_choice == "login"
    login
  elsif login_choice == "create"
    create_account
  else
    puts "Something Went Wrong... (login_or_create_account)."
  end
end

def main_menu(x)
  puts ""
  puts ""
  puts ""
  exit_app = false
  while(!exit_app) do

    puts "What do you want to do #{x.username}?"

    choices = ["View a profile", "View own profile", "Follow a user", "See Your Followers", "See Who You Follow", "Post A Photo", "Log Out"]
    response = PROMPT.enum_select("What would you like to do?", choices).chomp
    case response
    when choices[0] #view a profile
      desired = PROMPT.ask('Enter Username:').chomp
      x.show_followed_user_feed(desired)
    when choices[1] #view own profi;e
      x.display_feed
    when choices[2] #follow a user
     desired = PROMPT.ask('Enter Username To Follow:').chomp
      x.follow_via_username(desired)
    when choices[3] # see your followers
      x.get_followers.each { |fol| puts fol.username }
    when choices[4] #see who you follow
      x.get_followed.each { |fol| puts fol.username }
    when choices[5] #post a phoo
      user_image_url = PROMPT.ask('Enter Image URL to Post:').chomp
      x.post_via_url(user_image_url)
    when [6]
      exit_app = true
      puts "See you next time!"
    end

  end
end

def login
  user = PROMPT.ask('Enter Username:').chomp.downcase
  puts "[Look over your shoulder before typing (trust no-one)]"
  password = PROMPT.ask("Enter Password:").chomp
  puts ""
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
#  table = Terminal::Table.new :headings => ['LOGIN'], :rows => rows, :style => {:width => 80}
Catpix::print_image './lib/CLI/instagram-new.jpg',
  :limit_x => 0.4,
  :limit_y =>  0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => false,
  :resolution => "high"

  login_choice = PROMPT.select("Choose your destiny?", %w(Login Create Exit)).downcase
  if(login_choice != "exit")
    x= login_or_create_account(login_choice)
    main_menu(x)
  else
    puts "Fine, Ciao Loser."
  end
end

def follow
end
