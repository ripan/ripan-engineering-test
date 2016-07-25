class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :name, :history

  def history
    object.audits.map do |j|
      j.audited_changes.merge({:updated_at => j.created_at})
    end
  end

end
