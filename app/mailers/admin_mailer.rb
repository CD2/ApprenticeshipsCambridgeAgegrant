class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.no_training_provider.subject
  #
  def no_training_provider grant_detail
    @grant_detail = grant_detail
    mail to: "to@example.org"
  end

  def send_reminder grant_detail
    @grant_detail = grant_detail
    mail to: grant_detail.user.email
  end

  def no_review_15_weeks grant_detail
    @grant_detail = grant_detail
    mail to: grant_detail.user.email
  end
end
