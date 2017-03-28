class Home < ApplicationRecord
  validates :name, presence: true

  belongs_to :district
end
