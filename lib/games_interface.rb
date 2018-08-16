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
  name = get_name(games)
  ages = get_ages(games, name)
  add_event(games, name, ages)
end

def get_name(games) 
  print "Enter the name of the event: "
  name = gets.chomp.to_s
  return name
end

def get_ages(games, name)
  ages = []
  input = ""
  competitor_ordinal = "first"
  while input != "F" && input != "C"
    if ages.count > 0
      competitor_ordinal = "next"
    end 
    puts "Name: #{name}; Ages: #{ages}"
    print "Enter the age of the #{competitor_ordinal} competitor, (F)inish, or (C)ancel. "
    input = gets.chomp.upcase
    if input == "C"
      puts "**CANCELLED**"
      main_prompt_dialog(games)
    elsif input == "F"
      return ages
    elsif input.to_i.to_s == input
      ages.push(input.to_i)
    else
      puts "**Invalid input.**  Please enter a valid age (number), (F)inish, or (C)ancel."
    end
  end
end

def add_event(games, name, ages)
  event = Event.new(name, ages)
  games.add_event(event)
  puts "**EVENT ADDED** Name: #{event.name}; Ages: #{event.ages}"
  main_prompt_dialog(games)
end

def view_summary_dialog(games)
  # if events.length == 0, print "Nothing to display"
  puts "View summary data"
end

initialize_session