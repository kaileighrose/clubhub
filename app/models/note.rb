class Note < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :meeting
  validates :content, :author_id, presence: true
end
