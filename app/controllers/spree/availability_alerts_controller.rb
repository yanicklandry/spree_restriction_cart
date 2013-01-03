class Spree::AvailabilityAlertsController < Spree::BaseController 
  
  def index
    if(spree_current_user)
      @products = spree_current_user.products
    else
      flash[:error] = t(:alert_must_be_logged)
      redirect_to '/'
    end
  end
  
  def create
    @product = Spree::Product.find(params[:product])
    if(spree_current_user)
      @product.users << spree_current_user if((@product.users & [spree_current_user]).empty?)
      @product.save
      redirect_to '/availability_alerts/'
    else
      flash[:error] = t(:alert_must_be_logged)
      redirect_to @product
    end
  end
  
  def destroy
    if(spree_current_user)
      @product = Spree::Product.find(params[:product])
      spree_current_user.products.delete(@product)
      redirect_to '/availability_alerts/'
    else
      flash[:error] = t(:alert_must_be_logged)
      redirect_to '/'
    end
  end
  
  def self.list_with_product(product)
    product.users.collect do |u|
      u.email
    end.join(", ")
  end
  
end
