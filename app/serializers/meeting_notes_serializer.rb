class MeetingNotesSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :author_name, :content
  has_one :author, serializer: NoteAuthorSerializer
end
