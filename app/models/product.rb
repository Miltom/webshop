class Product < ActiveRecord::Base

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
			with: %r{\.(gif|jpe?g|png)\Z}i,
			message: 'must be a URL for GIF, JPG or PNG image.'
			}
   validate :something
         
         
   def something
         if(price!=nil)
            if(price%0.05!=0)
               errors.add(:price, 'Rappen nur in 5 Schritten erlaubt')
            end
         end
   end 
end
