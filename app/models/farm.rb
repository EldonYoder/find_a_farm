# == Schema Information
#
# Table name: farms
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  address       :string(255)
#  latitude      :float
#  longitude     :float
#  hours_open    :string(255)
#  days_open     :string(255)
#  months_open   :string(255)
#  phone_num     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  email_address :string(255)
#  payment_types :string(255)
#  offer_spring  :string(255)
#  offer_summer  :string(255)
#  offer_fall    :string(255)
#  offer_winter  :string(255)
#

class Farm < ActiveRecord::Base

	belongs_to :user
	has_many :links
	has_many :comments
	has_many :ratings, as: :rateable
	has_many :connections

	validates_presence_of :name, :description, :address, :hours_open, :days_open, :months_open, :phone_num, :payment_types

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

end
