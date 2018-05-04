require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


test "vent should be savedalid event should be" do
  event = Event.new(name: "Rubyschool", satrt_date:DateTime.now(), end_date: 6.weeks.from_now)
  assert event_save
end
end
