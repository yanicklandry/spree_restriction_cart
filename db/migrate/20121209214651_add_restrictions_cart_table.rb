class AddRestrictionsCartTable < ActiveRecord::Migration
  def change
    create_table :spree_restrictions_cart do |t|
      t.integer :product_id, :references => :spree_products
      t.integer :role_id, :references => :spree_roles
    end
    add_index :spree_restrictions_cart, ["product_id", "role_id"]
  end
end
