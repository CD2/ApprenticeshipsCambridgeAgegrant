# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/no_training_provider
  def no_training_provider
    AdminMailer.no_training_provider
  end

end
