class MeetingSerializer < ActiveModel::Serializer
  attributes :id, :team_id, :team_name, :time, :location
  has_many :notes, serializer: MeetingNotesSerializer
end
