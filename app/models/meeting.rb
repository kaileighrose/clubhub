require 'pry'
class Meeting < ActiveRecord::Base
  belongs_to :team
  belongs_to :space
  has_many :notes
  #accepts_nested_attributes_for :notes

  validates :time, presence: true
  validates :team_id, presence: true
  validate :date_in_future

  def notes_attributes=(note)
    newn = Note.find_or_create_by(id: note["0"]["id"])
    newn = Note.update(author_id: note["0"]["author_id"], meeting_id: self, content: note["0"]["content"])
    newn.save
    self.notes << newn
  end

  def date_in_future
    if time != nil && time < Date.today
      errors.add(:time, "-- you can't schedule a meeting in the past")
    end
  end
end
