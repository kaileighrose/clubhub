class MeetingSerializer < ActiveModel::Serializer
  attributes :id, :team_id, :time, :location
  has_many :notes, serializer: MeetingNotesSerializer
end
