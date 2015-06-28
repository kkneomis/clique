class CliqueMailer < ActionMailer::Base
  default from: "cliquecode@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.clique_mailer.membership_notification.subject
  #
  def membership_notification(user)
    @greeting = "Hi"

    mail to: user.email, subject: "Success! You did it."
  end
  
  def sale(seller)
    @content = "Someone attempted to buy stuff from you. Go to beencliqued.com login to view all purchases. Make sure all purchases are marked 'complete' before shipping out materials. Thank you for doing business with Clique."
    @seller= seller
    mail to: @seller.email, subject: "Someone wants to buy your item"
  end
  
  def purchase(buyer)
    @content = "This email confirms the receipt of your payment. Your order will be shipped soon." 
    @buyer = buyer
    mail to: @buyer.email, subject: "You bought something with clique."       
  end
  
  
end
