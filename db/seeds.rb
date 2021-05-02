unless Customer.exists?
  125.times do
    Customer.create! name: Faker::Name.name, email: Faker::Internet.email, company: Faker::Company.name, age: rand(18..70), state: ["Active", "Inactive", "Pending", "Suspended"].sample
  end
end
