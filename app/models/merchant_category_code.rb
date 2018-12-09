class MerchantCategoryCode < ApplicationRecord
  has_and_belongs_to_many :card_types
end

# == Schema Information
#
# Table name: merchant_category_codes
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string(3)
#  limit      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
