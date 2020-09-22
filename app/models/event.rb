class Event < ApplicationRecord
  validates :description, presence: true, length: {minimum:3, maximum:200}
  validates :title, presence: true, length: {minimum:3, maximum:35}
  validates :location, :end_date, :title, :start_date, presence: true
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  scope :past, -> { where("end_date < ?", DateTime.now) }
  scope :upcoming, -> { where("start_date > ?", DateTime.now) }
  scope :today, -> { where("? BETWEEN start_date AND end_date", DateTime.now) }
  # Ex:- scope :active, -> {where(:active => true)}
  # Ex:- scope :active, -> {where(:active => true)}
end
