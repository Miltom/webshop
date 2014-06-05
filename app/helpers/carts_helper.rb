module CartsHelper
def sumaryprice()
      summe=0;
         @cart.line_items.each do |item|
          summe += item.product.price * item.quantity
         end
      return price_in_chf(summe);
   end
end
