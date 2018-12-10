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

cards = Card.first(2)
employees = Employee.first(2)
merchant_category_codes = MerchantCategoryCode.pluck(:code, :id).to_h
[
  { employee_id: employees[0].id, card_id: cards[0].id, merchant_category_code_id: merchant_category_codes['FDG'], transaction_id: SecureRandom.alphanumeric(30), merchant_name: 'Swiggy', amount: 187.0, status: 'Success' },
  { employee_id: employees[0].id, card_id: cards[0].id, merchant_category_code_id: merchant_category_codes['MED'], transaction_id: SecureRandom.alphanumeric(30), merchant_name: 'Apollo', amount: 105.0, status: 'Denied' },
  { employee_id: employees[1].id, card_id: cards[1].id, merchant_category_code_id: merchant_category_codes['MED'], transaction_id: SecureRandom.alphanumeric(30), merchant_name: 'Swiggy', amount: 1005.0, status: 'Success' },
  { employee_id: employees[1].id, card_id: cards[1].id, merchant_category_code_id: merchant_category_codes['MED'], transaction_id: SecureRandom.alphanumeric(30), merchant_name: 'Apollo', amount: 1200.0, status: 'Success' }
].each do |transaction|
  Transaction.create(transaction)
end