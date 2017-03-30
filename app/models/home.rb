class Home < ApplicationRecord
  validates :name, presence: true

  belongs_to :district

  has_many :eventdateships
  has_many :eventdates, :through => :eventdateships
end
