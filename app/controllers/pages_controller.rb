class PagesController < ApplicationController

  before_action :email_10_weeks_ago

  def home
    if params[:url].present?
      redirect_to root_url
    end
  end

  def show
    @page = site_pages.find_by(url_alias: params[:id])
  end

  private

  def email_10_weeks_ago
    # begin
    #   # puts GrantDetail.where("to_date(apprentice_start_date, 'DD/MM/YY') <= :week AND reminder_email_sent = false", {:week => 10.weeks.ago}).count
    #   # GrantDetail.where("to_date(apprentice_start_date, 'DD/MM/YY') <= :week AND reminder_email_sent = false", {:week => 10.weeks.ago}).each_with_index do |gd, i|
    #   #   if i == 0
    #   #     AdminMailer.send_reminder(gd, site_url).deliver_now
    #   #     AdminMailer.send_tp_reminder(gd, site_url).deliver_now
    #   #     gd.update(reminder_email_sent: true)
    #   #   end
    #   end
    #   # GrantDetail.where("DATE(apprentice_start_date) <= :week AND no_review_15_weeks_email = false", {:week => 15.weeks.ago}).each_with_index do |gd, i|
    #   #   next if gd.review_submitted
    #   #   AdminMailer.no_review_15_weeks(gd).deliver_now
    #   #   gd.update(no_review_15_weeks_email: true)
    #   # end
    # rescue
    # end
  end

end
