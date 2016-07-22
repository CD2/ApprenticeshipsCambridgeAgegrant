task reset_all: :environment do

  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['seed'].invoke

end

task seed: :environment do
  
  Rake::Task['db:migrate'].invoke
  User.create(email: 'web@cd2solutions.co.uk', password: 'drowssap')
  Rake::Task['seed_pages'].invoke
  Rake::Task['seed_training_providers'].invoke
  Rake::Task['sample_data'].invoke

 
end


