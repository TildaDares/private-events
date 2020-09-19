class User < ApplicationRecord
  validates :name, presence: true, length: {minimum:3, maximum:15}
  validates_uniqueness_of :name, on: :create, message: "must be unique"
  has_many :hosted_events, class_name: "Event", foreign_key: "creator_id"
  has_many :attended_events, class_name: "Event", foreign_key: "attendee_id"
end
