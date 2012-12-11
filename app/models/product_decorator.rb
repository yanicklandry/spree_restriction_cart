Spree::Product.class_eval do
  attr_accessible :role_ids

  has_and_belongs_to_many :roles, :join_table => 'spree_restrictions_cart'
  
  def available_for?(user)
    if self.roles.nil? or self.roles.empty?
      true
    else
      !!(user and !!(self.roles & user.spree_roles))
    end
  end
end