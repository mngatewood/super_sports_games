# games_interface.rb

require './lib/games'
require './lib/event'
require 'pry'

def initialize_session
  puts "Welcome to Games Interface."
  year = ""
  while year.to_i < 1896 || year.to_i > 2018
    print "Enter the year of the games to begin: "
    year = gets.chomp
    if year.to_i < 1896 || year.to_i > 2018
      puts "**INVALID INPUT** Please enter a valid year between 1986 and 2018."
    else
      games = Games.new(year)
      main_prompt_dialog(games)
    end
  end
end

def main_prompt_dialog(games)
  input = ""
  # better way to write condition?
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

# Refactor get_ages method
def get_ages(games, name)
  ages = []
  input = ""
  competitor_ordinal = "first"
  # better way to write condition?
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
      if ages.count > 0
        return ages
      else
        puts "**NO AGES ENTERED** Please enter at least one competitor age."
        input = ""
      end
    elsif input.to_i.to_s == input
      ages.push(input.to_i)
    else
      puts "**INVALID INPUT.**  Please enter a valid age (number), (F)inish, or (C)ancel."
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
  if games.events.length == 0
    puts "**NO EVENTS TO DISPLAY** Please add an event."
  else
    puts games.summary
  end
  main_prompt_dialog(games)
end

initialize_session