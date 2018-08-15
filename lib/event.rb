# event.rb

class Event

  attr_reader :name,
              :ages

  def initialize(name, ages)
    @name = name
    @ages = ages
  end

end