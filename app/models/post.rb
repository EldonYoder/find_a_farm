# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  status     :string(255)      default("draft")
#  content    :text
#  farm_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

class Post < ActiveRecord::Base
	belongs_to :farm

	validates_presence_of :title
	validates_presence_of :content
end
