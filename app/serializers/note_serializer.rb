class NoteSerializer < ActiveModel::Serializer
  attributes :author_id, :meeting_id, :content
  has_one :meeting
end
