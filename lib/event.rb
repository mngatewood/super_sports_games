# event.rb

require 'pry'

class Event

  attr_reader :name,
              :ages

  def initialize(name, ages)
    @name = name
    @ages = ages
  end

  def max_age
    ages.max.to_i
  end

  def min_age
    ages.min.to_i
  end

  def average_age
    (ages.sum.to_f / ages.count).round(1)
  end

  def standard_deviation_age
    # Subtract average age from each element of ages and return new array
    ages_diff = ages.map { |i| (i - average_age).round(1) }
    # Square each element in the previous array and return new array
    ages_diff_squared = ages_diff.map { |i| (i * i).round(2) }
    # Calculate the average of all elements in the previous array
    ages_diff_squared_avg = ages_diff_squared.sum / ages.count
    # Return the square root of the average calculated above
    return Math.sqrt(ages_diff_squared_avg).round(2)
  end

# binding.pry

end