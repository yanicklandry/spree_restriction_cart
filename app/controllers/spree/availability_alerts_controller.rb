class Spree::AvailabilityAlertsController < Spree::BaseController 
  
  def index
    if(spree_current_user)
      @products = spree_current_user.products
    end
  end
  
  def create
    if(spree_current_user)
      @product = Spree::Product.find(params[:product])
      @product.users << spree_current_user if((@product.users & [spree_current_user]).empty?)
      @product.save
      redirect_to '/availability_alerts/'
    end
  end
  
  def destroy
    if(spree_current_user)
      @product = Spree::Product.find(params[:product])
      spree_current_user.products.delete(@product)
    end
    redirect_to '/availability_alerts/'
  end
  
  def self.list_with_product(product)
    product.users.collect do |u|
      u.email
    end.join(", ")
  end
  
end
