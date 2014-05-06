require 'test_helper'

class CartTest < ActiveSupport::TestCase

   setup do
   
      @cart = Cart.create
      
      # Create 1. testproduct
      @product1 = Product.create(title: "countertestproduct",
                  description: "product counter",
                  image_url: "test.png",
                  price: 2)

      # Create 2. testproduct
      @product2 = Product.create(title: "countertestproduct2",
                  description: "product counter2",
                  image_url: "test2.png",
                  price: 5)
   end

   
    test "testing the cart.line_items.count, should be 1" do
      @cart.add_product(@product1.id)
      @cart.save
      
      # Should be 1
      assert_equal @cart.line_items.count, 1
      
      @cart.add_product(@product1.id)
      @cart.save
      
      # Should be still 1 because both products have the same id
      assert_equal @cart.line_items.count, 1
   end
   
   test "testing the cart.line_items.count, should be 2" do   
      @cart.add_product(@product1.id)
      @cart.save
      
      # Should be 1
      assert_equal @cart.line_items.count, 1
      
      # Adding another testproduct to test the cart.line_items.count  
      @cart.add_product(@product2.id)
      @cart.save
     
      # Should be 2 because they are 2 different products with different id's
      assert_equal @cart.line_items.count, 2
  end
  
end