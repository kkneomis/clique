class CliqueMailer < ActionMailer::Base
  default from: "cliquecode@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.clique_mailer.membership_notification.subject
  #
  def membership_notification
    @greeting = "Hi"

    mail to: "skakpovi@gmail.com", subject: "Success! You did it."
  end
end
