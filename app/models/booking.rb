class Booking < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  has_many :reviews

  def date_formatted
    self[:date].to_formatted_s(:long)
  end

  def time_formatted
    self[:time].strftime("%I:%M %p")
  end
end
