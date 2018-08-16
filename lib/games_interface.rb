require './games'
require './event'
require 'pry'

def initialize_session
  puts "Welcome to Games Interface."
  print "Enter the year of the games to begin: "
  year = gets.chomp
  games = Games.new(year)
  main_prompt_dialog(games)
end

def main_prompt_dialog(games)
  input = ""
  while input != "A" && input != "V" && input != "X"
    print "(A)dd an event, (V)iew the Summary of Events, or e(X)it. "
    input = gets.chomp.upcase
    if input == "A"
      get_event_data(games)
    elsif input == "V"
      view_summary_dialog(games)
    elsif input == "X"
      exit
    end
  end
end

def get_event_data(games)
  puts "Get event data"
end

def view_summary_dialog(games)
  puts "View summary data"
end

initialize_session