require 'pry'
class Meeting < ActiveRecord::Base
  belongs_to :team
  belongs_to :space
  has_many :notes

  validates :time, presence: true
  validates :team_id, presence: true
  validate :date_in_future

  def notes_attributes=(note)
    if note["0"]["content"] != nil
      if note["0"]["id"] == nil || note["0"]["id"] == ""
        newn = Note.create(author_id: note["0"]["author_id"], meeting_id: self.id, content: note["0"]["content"])
        self.notes << newn
      else
        newn = Note.find(note["0"]["id"])
        newn.update(author_id: note["0"]["author_id"], meeting_id: self.id, content: note["0"]["content"])
        newn.save
      end
    end
  end

  def date_in_future
    if time != nil && time < Date.today
      errors.add(:time, "-- you can't schedule a meeting in the past")
    end
  end
end
