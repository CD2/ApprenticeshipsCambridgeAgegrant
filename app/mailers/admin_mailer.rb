class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.no_training_provider.subject
  #

  def no_training_provider grant_detail, send_to
    @grant_detail = grant_detail
    mail subject: 'AGE Grant Application', to: send_to
  end

  def send_reminder grant_detail, url
    @grant_detail = grant_detail
    @url = url
    mail subject: 'AGE Grant Application', to: grant_detail.user.email
  end

  def send_tp_reminder grant_detail, url
    @grant_detail = grant_detail
    @url = url
    mail subject: 'AGE Grant Application', to: grant_detail.training_provider.email
  end

  def no_review_15_weeks grant_detail
    @grant_detail = grant_detail
    mail subject: 'AGE Grant Review', to: grant_detail.user.email
  end

  def approve_application grant_detail
    @grant_detail = grant_detail
    mail subject: 'Application Approved', to: grant_detail.user.email
    #mail subject: 'Application Approved', to: 'shane@cd2solutions.co.uk'
  end

  def notify_training_provider grant_detail
    @grant_detail = grant_detail
    mail subject: 'AGE Grant Application', to: grant_detail.training_provider.email
  end

  def grant_review_uploaded grant_detail, send_to
    @grant_detail = grant_detail
    mail subject: 'New Evidence Uploaded', to: send_to
  end

  def grant_review_uploaded_for_p grant_detail
    @grant_detail = grant_detail
    mail subject: 'AGE Grant Application Uploaded', to: grant_detail.user.email
  end

  def prompt_for_declaration grant_detail
    @grant_detail = grant_detail
    mail subject: 'AGE Grant Application', to: grant_detail.user.email
  end

end
