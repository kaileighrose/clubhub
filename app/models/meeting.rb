class Meeting < ActiveRecord::Base
  belongs_to :team
  belongs_to :space
  has_many :notes
  accepts_nested_attributes_for :notes

  validates :time, presence: true
  validates :team_id, presence: true
  validate :date_in_future

  def note_attributes=(note)
    newn = Note.create(author_id: current_user.id, meeting_id: self.id, content: note.content)
    newn.save
    self.notes << newn
  end

  def date_in_future
    if time < Date.today
      errors.add(:time, "-- you can't schedule a meeting in the past")
    end
  end
end
