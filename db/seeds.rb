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