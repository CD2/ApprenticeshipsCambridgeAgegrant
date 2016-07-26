task reset_all: :environment do

  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['seed'].invoke

end

task seed: :environment do
  
  Rake::Task['db:migrate'].invoke
  Rake::Task['seed_pages'].invoke
  Rake::Task['seed_training_providers'].invoke
  #Rake::Task['sample_data'].invoke


  User.create!(name: 'CD2', email: 'web@cd2solutions.co.uk', password: 'apprentice', admin: true)
  User.create!(email: 'paul.wright@norfolk.gov.uk', password: 'apprentice', admin: true)
  User.create!(email: 'j.starling@norfolk.gov.uk', password: 'apprentice', admin: true)
  User.create!(email: 'Melinda.fargo@norfolk.gov.uk', password: 'apprentice', admin: true)

end
