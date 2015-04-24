class Item < ActiveRecord::Base
  
  validates :name, :description, :price, :image, presence: true
  validates :price, numericality:{ greater_than: 0}  
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  
  def paypal_url(return_url) 
      values = { 
        :business => 'buy@clique.com',
            :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      }	
      values.merge!({ 
      "amount_1" => price,
      "item_name_1" => name,
      "item_number_1" => id,
      "quantity_1" => '1'
      });
             # For test transactions use this URL
      "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
 end 
  
  
end
