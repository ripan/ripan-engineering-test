class Supplier < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :materials
end
