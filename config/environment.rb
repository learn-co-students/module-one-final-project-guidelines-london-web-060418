require 'bundler'
require 'pry'
require 'progress_bar'
require 'tty-prompt'
# pid = fork{ exec ‘afplay’, “../lib/opening.mp3” }
# pid = fork{ exec ‘killall’, “afplay” }

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
require_all 'lib'
require_all 'app'
