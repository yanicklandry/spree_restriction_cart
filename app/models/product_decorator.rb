Spree::Product.class_eval do
  attr_accessible :role_ids
  attr_accessible :user_ids

  has_and_belongs_to_many :roles, :join_table => 'spree_restrictions_cart'
  has_and_belongs_to_many :users, :join_table => 'spree_availability_alerts'
  
  def available_for?(user)
    if self.roles.nil? or self.roles.empty?
      true
    else
      !!(user and !(self.roles & user.spree_roles).empty?)
    end
  end
end