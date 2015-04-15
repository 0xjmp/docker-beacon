class Zone < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :radius, :latitude, :longitude, :user, :visible
end