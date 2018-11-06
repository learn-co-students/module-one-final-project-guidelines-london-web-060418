#! /usr/bin/env ruby

require_relative '../config/environment'
cli = CLI.new

cli.welcome
cli.sign_in
cli.get_username
cli.congrats
cli.get_input
cli.menu
