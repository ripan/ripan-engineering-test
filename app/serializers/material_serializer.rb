class MaterialSerializer < ActiveModel::Serializer
  #attributes :id, :title, :episode, :year, :som, :eom, :aspect_ratio, :material_type, :delivery_channel_group, :duration
  attributes :title, :duration, :supplier
  has_one :supplier

  def supplier
  	object.supplier.name
  end
end
