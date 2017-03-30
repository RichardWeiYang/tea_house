class Eventdate < ApplicationRecord

    has_many :eventdateships
    has_many :homes, :through => :eventdateships
end
