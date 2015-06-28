# Preview all emails at http://localhost:3000/rails/mailers/clique_mailer
class CliqueMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/clique_mailer/membership_notification
  def membership_notification
    CliqueMailer.membership_notification
  end

end
