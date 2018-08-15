require 'minitest/autorun'
require 'minitest/pride'
require '../lib/event'

class EventTest < Minitest::Test

  def test_it_exists
    event = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_instance_of Event, event
  end

  def test_it_has_a_name
    event = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_equal "Curling", event.name
  end

  def test_it_has_ages
    event = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_equal [24, 30, 18, 20, 41], event.ages
  end

end
