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
