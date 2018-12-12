unless Admin.find_by_email('admin@zaggle.com')
  puts 'Seeding Admin...'
  Admin.create(email: 'admin@zaggle.com', password: 'password', password_confirmation: 'password')
end

puts 'Seeding Default Data...'
[
  { name: 'FOOD & GROCERIES', code: 'FDG', limit: '2200' },
  { name: 'FUEL', code: 'FUL', limit: '1600' },
  { name: 'PHARMACY & MEDICAL', code: 'MED', limit: '1250' },
  { name: 'TRAVEL', code: 'TRA', limit: '2000' },
  { name: 'INTERNET & MOBILE', code: 'MOB', limit: '1500' },
  { name: 'BOOKS', code: 'BOK', limit: '1000' }
].each do |mcc|
  MerchantCategoryCode.create(mcc)
end

[
  { name: 'ZEAL' },
  { name: 'ZINGER' }
].each do |ct| 
  CardType.create(ct)
end

zeal_card = CardType.where(name: 'ZEAL').first
zeal_card.merchant_category_codes << MerchantCategoryCode.where(code: 'FDG')

zinger_card = CardType.where(name: 'ZINGER').first
zinger_card.merchant_category_codes << MerchantCategoryCode.all

[
  { email: 'employee_1@zaggle.com', password: 'password', password_confirmation: 'password', employee_id: 'ABZ2718', mobile_number: '8452323520' },
  { email: 'employee_2@zaggle.com', password: 'password', password_confirmation: 'password',  employee_id: 'ABZ3118', mobile_number: '7353534043' }
].each do |employee|
  Employee.create(employee)
end

[
  { card_number: 5098876554322123, card_type_id: zeal_card.id, employee_id: Employee.first.id },
  { card_number: 5098876554322100, card_type_id: zinger_card.id, employee_id: Employee.second.id }
].each do |card|
  Card.create(card)
end


def transaction_id
  SecureRandom.alphanumeric(30)
end

[
  { merchant_code: 'FDG', merchant_name: 'Swiggy', amount: 187.0 },
  { merchant_code: 'FDG', merchant_name: 'Swiggy', amount: 105.0 },
  { merchant_code: 'MED', merchant_name: 'Apollo', amount: 1000.0 },
  { merchant_code: 'FUL', merchant_name: 'Indian Oil', amount: 500.0 },
  { merchant_code: 'FDG', merchant_name: 'Swiggy', amount: 187.0, created: (Time.now.last_month - 2.days).to_i },
  { merchant_code: 'FDG', merchant_name: 'Swiggy', amount: 105.0, created: (Time.now.last_month - 5.days).to_i },
  { merchant_code: 'MED', merchant_name: 'Apollo', amount: 1000.0, created: (Time.now.last_year - 20.days).to_i },
  { merchant_code: 'FUL', merchant_name: 'Indian Oil', amount: 500.0, created: (Time.now.last_year - 7.days).to_i }
].each do |params|
  Card.all.each do |card|
    txn = card.create_transaction(params.merge({id: transaction_id}))
    puts "#{card.card_type.name} - #{txn.error_message}"
  end
end