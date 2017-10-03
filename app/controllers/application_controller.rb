class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper


  before_action do
    $norfolk_site = norfolk_site?

    count = GrantDetail::OLD_LIMIT - GrantDetail.old_count

    if count <=0
      $age_date_limit = (25.years.ago+1.day).strftime('%d/%m/%Y')
    else
      $age_date_limit = (25.years.ago+1.day).strftime('%d/%m/%Y')
    end

  end

end
