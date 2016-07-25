class MaterialSerializer < ActiveModel::Serializer
  #attributes :id, :title, :episode, :year, :som, :eom, :aspect_ratio, :material_type, :delivery_channel_group, :duration
  attributes :title, :duration, :supplier, :history
  has_one :supplier

  def supplier
    object.supplier.name
  end

  def history
    object.audits.map do |j|
      j.audited_changes.merge({:updated_at => j.created_at})
    end
  end

end
