# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/no_training_provider
  def no_training_provider
    @grant_detail = GrantDetail.first
    AdminMailer.no_training_provider(@grant_detail)
  end

  def send_reminder
    @grant_detail = GrantDetail.first
    AdminMailer.send_reminder(@grant_detail, 'https://apprenticeshipscambridgeshire.org')
  end

  def no_review_15_weeks
    @grant_detail = GrantDetail.first
    AdminMailer.no_review_15_weeks(@grant_detail)
  end

end
