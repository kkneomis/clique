class Item < ActiveRecord::Base
 # include Payola::Sellable
  
  
  validates :name, :description, :price, :image, presence: true
  validates :price, numericality:{ greater_than: 0}  
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  
 
end
