class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.no_training_provider.subject
  #

  def no_training_provider grant_detail, send_to
    @grant_detail = grant_detail
    mail to: send_to
  end

  def send_reminder grant_detail, url
    @grant_detail = grant_detail
    @url = url
    mail to: grant_detail.user.email
  end

  def no_review_15_weeks grant_detail
    @grant_detail = grant_detail
    mail to: grant_detail.user.email
  end

  def approve_application grant_detail
    @grant_detail = grant_detail
    mail subject: 'Application Approved', to: grant_detail.user.email
  end

end
