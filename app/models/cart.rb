class Cart < ActiveRecord::Base
 has_many :line_items, dependent: :destroy
 
   def add_product(product_id)
      product_id = product_id.to_i;
      current_item = line_items.find_by(product_id: product_id)
      if current_item
         current_item.quantity += 1
      else
         current_item = line_items.build(product_id: product_id)
      end
      current_item
   end
   
   def sumaryprice
      summe=0
         self.line_items.each do |item|
          summe += item.product.price * item.quantity
         end
         
      #sprintf("%0.02f CHF", summe)
   summe
end
end