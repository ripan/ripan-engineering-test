class Supplier < ActiveRecord::Base
  audited
  validates :name, presence: true, uniqueness: true
  has_many :materials
end
