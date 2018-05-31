class Event < ApplicationRecord
  validates_presence_of :name, :message => "input is empty, do you have a name?"
  validates_presence_of :start_date, message: "input is empty, you can't have an event if you don't start it."
  validates_presence_of :end_date, message: "input is empty, you have to end the event evntually so indicate when."
  has_and_belongs_to_many :users, -> { distinct }
  
  #agregamos esto: verificamos si esta llena el evento
  def is_event_full?
    self.users.count >= self.max_students
  end
  
end
