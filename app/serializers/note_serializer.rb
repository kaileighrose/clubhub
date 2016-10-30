class NoteSerializer < ActiveModel::Serializer
  attributes :author_id, :meeting_id, :content, :author_name
  has_one :meeting
  has_one :author, serializer: NoteAuthorSerializer
end