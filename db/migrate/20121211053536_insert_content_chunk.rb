class InsertContentChunk < ActiveRecord::Migration
  def up
    cc = Spree::ContentChunk.new
    cc.kind = 'product_unavailable'
    cc.title_fr = "Produit non disponible"
    cc.body_fr = "<div>Malheureusement, cet article n&rsquo;est pas disponible pour la vente en ligne. Si vous d&eacute;sirez &ecirc;tre avis&eacute; lorsque l&rsquo;achat sera possible, <a href=\"mailto:service@perlimpinpin.com?subject=demande de produit pour ___SKU___\">contactez service@perlimpinpin.com</a></div>" 
    cc.title_en = "Product unavailable"
    cc.body_en = "<p>Sorry, this product is not available online. Let us know if you want to get informed when available, <a href=\"mailto:service@perlimpinpin.com?subject=request for product ___SKU___\">contact service@perlimpinpin.com</a>.</p>"
    cc.save
  end

  def down
    Spree::ContentChunk.destroy_all(:kind => 'product_unavailable')
  end
end
