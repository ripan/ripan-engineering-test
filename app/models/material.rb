class Material < ActiveRecord::Base
  audited on: [:update, :destroy]
  validates :title, presence: true, uniqueness: true
  belongs_to :supplier
  accepts_nested_attributes_for :supplier
  
  def duration
    self.eom - self.som
  end
end
