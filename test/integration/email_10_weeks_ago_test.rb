require 'test_helper'

class Email10WeeksAgoTest < ActionDispatch::IntegrationTest

  test 'emails at certain times weeks' do

    assert_difference 'ActionMailer::Base.deliveries.count', 4 do
      get '/check_if_emails_need_to_go_out_to_people_who_registered_10_weeks_ago'
    end
    
    assert_not grant_details(:grant_detail_9_weeks_ago).reminder_email_sent
    assert_not grant_details(:grant_detail_9_weeks_ago).no_review_15_weeks_email

    assert grant_details(:grant_detail_10_weeks_ago).reminder_email_sent
    assert_not grant_details(:grant_detail_10_weeks_ago).no_review_15_weeks_email

    assert grant_details(:grant_detail_14_weeks_ago).reminder_email_sent
    assert_not grant_details(:grant_detail_14_weeks_ago).no_review_15_weeks_email

    assert grant_details(:grant_detail_15_weeks_ago).reminder_email_sent
    assert grant_details(:grant_detail_15_weeks_ago).no_review_15_weeks_email

    assert_no_difference 'ActionMailer::Base.deliveries.count' do
      get '/check_if_emails_need_to_go_out_to_people_who_registered_10_weeks_ago'
    end

  end

end