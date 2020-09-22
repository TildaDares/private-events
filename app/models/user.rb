class User < ApplicationRecord
  validates :name, presence: true, length: {minimum:3, maximum:25}
  validates_uniqueness_of :name, on: :create, message: "must be unique"
  has_many :hosted_events, class_name: "Event", foreign_key: "creator_id"
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
end
