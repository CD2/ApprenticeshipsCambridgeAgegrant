class UserMailer < ApplicationMailer

  def password_reset user, site
    @user = user
    @site = site
    mail to: user.email, subject: "Password Reset"
  end

  def confirmation_email grant_detail
    @user = grant_detail.user
    mail to: @user.email, subject: "AGE grant application submitted"
  end

end
