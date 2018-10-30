30.times do |n|
  name = Faker::Name.name
  category = Faker::Number.number(3)
  station = Faker::Pokemon.name
  phone_number = Faker::Number.number(9)
  adress = Faker::Address
  payment = Faker::Number.number(4)
  impression = Faker::Coffee.notes
  # user_id = Faker::Number.number(2)

  Shop.create!(
    name: name,
    category: category,
    station: station,
    phone_number: phone_number,
    adress: adress,
    payment: payment,
    impression: impression,
    # user_id: user_id,
  )
end


