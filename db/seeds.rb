50.times do
  [].tap do |array|
    10_000.times do
      time = Time.current
      array << {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        bio: Faker::Quote.most_interesting_man_in_the_world,
        company: Faker::Company.name,
        age: rand(18..70),
        status: %w[Active Inactive Pending Suspended].sample,
        updated_at: time,
        created_at: time
      }
    end
    Customer.insert_all(array)
  end
end
