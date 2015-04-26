class Order < ActiveRecord::Base
  
  validates :address, :city, :state, presence: true
  validates :quantity, numericality:{ greater_than: 0}  
  validates :price, numericality:{ greater_than: 0}
  belongs_to :item
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  
  return_url = "http://beefy-white-harbor-11-170758.use1.nitrousbox.com/"
  
   def paypal_url(return_url) 
      values = { 
        :business => seller.email,
            :cmd => '_cart',
      :upload => 1,
      :return => "http://beefy-white-harbor-11-170758.use1.nitrousbox.com/",
      }	
      values.merge!({ 
       "amount_1" => price,
       "item_name_1" => item.name,
      "item_number_1" => id,
      "quantity_1" => quantity
      });
             # For test transactions use this URL
      "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
 end 
  
  
  
end
