class RegistrationMailer < ApplicationMailer

  def mentor_registration mentor
    @mentor = mentor
    mail(from: 'welcome@vetseast.com', to: @mentor.email, subject: "You have new messages at vetseast.com")
  end

  def mentee_registration mentee
    @mentee = mentee
    mail(from: 'welcome@vetseast.com', to: @mentee.email, subject: "You have new messages at vetseast.com")

  end

end
