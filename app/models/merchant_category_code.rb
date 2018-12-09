class MerchantCategoryCode < ApplicationRecord
end

# == Schema Information
#
# Table name: merchant_category_codes
#
#  id         :integer          not null, primary key
#  limit      :integer
#  code       :string(3)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
