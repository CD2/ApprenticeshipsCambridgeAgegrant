task reset_all: :environment do
  
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['seed'].invoke

end

task seed: :environment do
  
  Rake::Task['db:migrate'].invoke
  Rake::Task['seed_pages'].invoke

end