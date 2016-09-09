class Meeting < ActiveRecord::Base
  belongs_to :team
  belongs_to :space

  validates :time, presence: true
  validates :team_id, presence: true
  validate :date_in_future

  def date_in_future
    if time < Date.today
      errors.add(:time, "-- you can't schedule a meeting in the past")
    end
  end
end
