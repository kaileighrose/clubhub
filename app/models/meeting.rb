require 'pry'
class Meeting < ActiveRecord::Base
  belongs_to :team
  has_many :notes

  validates :time, presence: true
  validates :team_id, presence: true
  validate :date_in_future

  @@existing_locations = [];

  def self.existing_locations
    Meeting.all.each do |m|
      if m.location != nil && !@@existing_locations.include?(m.location)
        @@existing_locations << m.location
      end
    end
    @@existing_locations
  end

  def notes_attributes=(note)
    if note["0"]["content"] != nil
      if note["0"]["id"] == nil || note["0"]["id"] == ""
        newn = Note.create(author_id: note["0"]["author_id"], meeting_id: self.id, content: note["0"]["content"])
        author = User.find(newn.author_id)
        newn.author_name = author.name
        newn.save
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
