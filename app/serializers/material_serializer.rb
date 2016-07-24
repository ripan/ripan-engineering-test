class MaterialSerializer < ActiveModel::Serializer
  attributes :id, :title, :episode, :year, :som, :eom, :aspect_ratio, :material_type, :deliveryChannelGroup
  has_one :supplier
end
