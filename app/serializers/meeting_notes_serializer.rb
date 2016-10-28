class MeetingNotesSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :content
  has_one :author, serializer: NoteAuthorSerializer
end
