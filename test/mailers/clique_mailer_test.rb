require 'test_helper'

class CliqueMailerTest < ActionMailer::TestCase
  test "membership_notification" do
    mail = CliqueMailer.membership_notification
    assert_equal "Membership notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
