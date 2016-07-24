class MaterialSerializer < ActiveModel::Serializer
  attributes :id, :title, :episode, :year, :som, :eom, :aspect_ratio, :material_type, :delivery_channel_group
  has_one :supplier
end
