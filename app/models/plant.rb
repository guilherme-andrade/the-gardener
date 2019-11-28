class Plant < ApplicationRecord
  belongs_to :garden

  has_many :gardener_plants
  has_many :gardeners, through: :gardener_plants

  validates :name, presence: true
end
