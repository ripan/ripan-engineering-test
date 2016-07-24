class Material < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :supplier
end
