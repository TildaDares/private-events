class Event < ApplicationRecord
  validates :description, presence: true, length: {minimum:3, maximum:200}
  validates :title, presence: true, length: {minimum:3, maximum:35}
  validates :location, :end_date, :title, :start_date, presence: true
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :attendees, class_name: "User", foreign_key: "attendee_id"
end
