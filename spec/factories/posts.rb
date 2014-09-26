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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
  end
end
