# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  rate_value    :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  has_visited   :boolean
#  rateable_id   :integer
#  rateable_type :string(255)
#

class Rating < ActiveRecord::Base
	belongs_to :rateable, polymorphic: true
	belongs_to :user
	validates_presence_of :rate_value
	validates_presence_of :has_visited
end
