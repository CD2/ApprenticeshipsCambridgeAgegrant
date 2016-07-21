require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "no_training_provider" do
    mail = AdminMailer.no_training_provider
    assert_equal "No training provider", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
