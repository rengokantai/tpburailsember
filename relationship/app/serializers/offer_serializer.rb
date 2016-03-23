class OfferSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :status, :valid_until
end
