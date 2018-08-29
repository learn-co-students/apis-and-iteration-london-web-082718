#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome

def run
  case display_menu
    when "1"
      character = get_user_choice("character")
      puts "You have selected #{character}:"
      show_character_movies(character)
      run
    when "2"
      film = get_user_choice("film")
      puts "You have selected #{film}:"
      get_film_info(film)
      run
    when 'q'
      exit
    else
      puts "That's not a valid entry"
      run
    end
end

run
