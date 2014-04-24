module StoreHelper
	def price_in_chf(price)
      if(price!=nil)
         return sprintf("%0.02f CHF", price)
      end
   end
end
