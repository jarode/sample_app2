class Auction < ActiveRecord::Base
  attr_accessible :content#, :date, :price
  
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  
  
  default_scope order: 'auctions.created_at DESC'
end
