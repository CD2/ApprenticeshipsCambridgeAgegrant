# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/no_training_provider
  def no_training_provider grant_detail
    @grant_detail =
    AdminMailer.no_training_provider()
  end

  def send_reminder

  end

  def no_review_15_weeks

  end

end
