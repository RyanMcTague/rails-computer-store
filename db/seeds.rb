PASSWORD = "Password1"

puts "Creating Admins..."
###=======================
admin = User.create!({
  email: "admin@example.com",
  firstname: "John",
  lastname: "Doe",
  password: PASSWORD,
  password_confirmation: PASSWORD,
  confirmed_at: DateTime.now
})

admin.add_role(:admin)

puts "Creating Staff..."
###=======================
5.times do
  staff = User.create!({
    email: Faker::Internet.email,
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    password: PASSWORD,
    password_confirmation: PASSWORD,
    confirmed_at: DateTime.now
  })
  
  staff.add_role(:staff)
end

puts "Creating Brands..."
###=======================
intel_brand = Brand.create!({
  name: "Intel Corporation",
  identifier: "Intel",
  description: Faker::Lorem.paragraph(sentence_count: 5)
})

amd_brand = Brand.create!({
  name: "Advanced Micro Devices, Inc",
  identifier: "AMD",
  description: Faker::Lorem.paragraph(sentence_count: 5)
})

msi_brand = Brand.create!({
  name: "Micro-Star International Corporation",
  identifier: "MSI",
  description: Faker::Lorem.paragraph(sentence_count: 5)
})

puts "Creating Departments..."
###=======================
cpus_department = Department.create!({
  name: "CPUs",
  department_type: :components,
  description: Faker::Lorem.paragraph(sentence_count: 5)
})

motherboards_department = Department.create!({
  name: "Motherboards",
  department_type: :components,
  description: Faker::Lorem.paragraph(sentence_count: 5)
})

graphics_cards_department = Department.create!({
  name: "Graphics Cards",
  department_type: :components,
  description: Faker::Lorem.paragraph(sentence_count: 5)
})

puts "Creating Department Managers..."
###=======================
Brand.find_each do |brand|
  manager = User.create!({
    email: "#{brand.name.downcase.sub(" ", "_")}@example.com",
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    password: PASSWORD,
    password_confirmation: PASSWORD,
    confirmed_at: DateTime.now
  })
  manager.add_role :brand_manager, brand
  []]']]]'
end

puts "Creating Products..."
###=======================
intel_i7_processor = Product.create!({
  name: "Intel Core i7-11700K",
  description: Faker::Lorem.paragraph(sentence_count: 5),
  brand: intel_brand,
  department: cpus_department
})

intel_i5_processor = Product.create!({
  name: "Intel Core i5-10400F",
  description: Faker::Lorem.paragraph(sentence_count: 5),
  brand: intel_brand,
  department: cpus_department
})