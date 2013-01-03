class AddAvailabilityAlertsTable < ActiveRecord::Migration
  def change
    create_table :spree_availability_alerts do |t|
      t.integer :product_id, :references => :spree_products
      t.integer :user_id, :references => :spree_users
    end
    add_index :spree_restrictions_cart, ["product_id", "user_id"]
  end
end
