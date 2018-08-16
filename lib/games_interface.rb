require './games'
require './event'
require 'pry'

def initialize_session
  puts "Welcome to Games Interface."
  print "Enter the year of the games to begin: "
  year = gets.chomp
  games = Games.new(year)
  puts games.year
end

initialize_session