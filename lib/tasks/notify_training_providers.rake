task notify_training_providers: :environment do

  GrantDetail.all.each(&:notify_training_provider)

end
