require 'minitest/autorun'
require 'minitest/pride'
require '../lib/event'

class EventTest < Minitest::Test

  def test_it_exists
    event = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_instance_of Event, event
  end

end
