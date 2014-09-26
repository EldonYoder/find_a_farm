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

require 'rails_helper'

RSpec.describe Post, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
