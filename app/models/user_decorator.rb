Spree::User.class_eval do
  attr_accessible :product_ids
  has_and_belongs_to_many :products, :join_table => 'spree_availability_alerts'
end