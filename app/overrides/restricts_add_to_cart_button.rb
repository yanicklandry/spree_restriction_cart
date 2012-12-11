# Deface::Override.new(:virtual_path => "spree/products/_cart_form",
#                      :name => "restricts_add_to_cart_button",
#                      :insert_top => ".add-to-cart",
#                      #:partial => 'spree/products/product_availability'
#                      :text => '<% Spree::ContentChunk.where(:kind => "product_unavailable").each do |chunk| %>
#   <div class="">
#     <h3><%= chunk.title %></h3>
#     <div><%= chunk.body.sub("___SKU___", @product.sku).html_safe %></div>
#   </div>
# <% end %>
# </div>
# <div style="display:none;">'
#                      )

Deface::Override.new(:virtual_path => "spree/products/_cart_form",
:name => "restricts_add_to_cart_button",
:insert_top => "#product_unavailable",
:partial => 'spree/products/product_availability'
)
