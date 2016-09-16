class Note < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :meeting
  validates :content, :meeting_id, :author_id, presence: true
end
