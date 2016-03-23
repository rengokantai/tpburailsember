class NoteSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :description
  has_one :contact
  has_one :topic
end
