task reset_all: :environment do

  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['seed'].invoke

end

task seed: :environment do
  
  Rake::Task['db:migrate'].invoke
  User.create(email: 'web@cd2solutions.co.uk', password: 'drowssap')
  Rake::Task['seed_pages'].invoke

end