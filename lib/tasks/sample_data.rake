task sample_data: :environment do

  Faker::Config.locale = 'en'

  30.times do |i|

    User.create!({
      forename: Faker::Name.first_name  ,
      surname: Faker::Name.last_name ,
      email: Faker::Internet.email ,
      password: 'password'
    })


    puts "#{i+1}/30"
    GrantDetail.create!({
      work_number: Faker::PhoneNumber.phone_number ,
      mobile_number: Faker::PhoneNumber.cell_phone,
      company_name: Faker::Company.name,
      address_line_one: Faker::Address.street_address,
      address_line_two: Faker::Address.secondary_address,
      town_name: Faker::Address.city,
      county: Faker::Address.state,
      postcode: Faker::Address.postcode,
      learner_name: Faker::Name.name,
      learner_dob: Faker::Date.between(50.years.ago, 20.years.ago),
      apprentice_start_date: Faker::Date.between(1.year.ago, 1.year.from_now),
      share_info_checkbox: true,
      training_provider: Faker::Number.between(0, 2),
      bank_name:Faker::Company.name,
      account_number: Faker::Business.credit_card_number,
      sort_code: Faker::Number.number(3) ,
      signature: Faker::Name.name,
      user_id: i+1,
      title: Faker::Number.between(0,3)
      })

  end


end