class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper


  before_action do
    $norfolk_site = norfolk_site?

    count = if norfolk_site?
      345 - GrantDetail.old_count
    else
      120 - GrantDetail.old_count
    end

    if count <=0
      $age_date_limit = (19.years.ago+1.day).strftime('%d/%m/%Y')
    else
      $age_date_limit = 24.years.ago.strftime('%d/%m/%Y')
    end

  end

end
