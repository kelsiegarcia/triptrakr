class Location < ActiveRecord::Base
  belongs_to :trip
  has_one :address
  has_many :items
end
