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
    if note["content"] != nil 
      newn = Note.find_or_create_by(id: note["id"])
      newn.update(author_id: note["author_id"], meeting_id: self.id, content: note["content"])
      newn.save
      binding.pry
      if !!self.notes.include?(newn)
        self.notes << newn
      end
    end
  end

  def date_in_future
    if time != nil && time < Date.today
      errors.add(:time, "-- you can't schedule a meeting in the past")
    end
  end
end
