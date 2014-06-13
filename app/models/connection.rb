# == Schema Information
#
# Table name: connections
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  farm_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Connection < ActiveRecord::Base
	belongs_to :farm
	belongs_to :user
end
