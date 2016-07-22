class PagesController < ApplicationController

  def email_10_weeks_ago
    GrantDetail.where("created_at <= :week AND reminder_email_sent = false", {:week => 10.weeks.ago}).each do |gd|
      AdminMailer.send_reminder(gd).deliver_now
      gd.update(reminder_email_sent: true)
    end
    GrantDetail.where("created_at <= :week AND no_review_15_weeks_email = false", {:week => 15.weeks.ago}).each do |gd|
      next if gd.review_submitted
      AdminMailer.no_review_15_weeks(gd).deliver_now
      gd.update(no_review_15_weeks_email: true)
    end
    head :ok
  end

  def show
    @page = site_pages.find_by(url_alias: params[:id])
  end

end
