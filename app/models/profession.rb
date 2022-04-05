class Profession < ApplicationRecord
  has_and_belongs_to_many :clients
  validates :name, presence: true
  validates :name, uniqueness: true

end
