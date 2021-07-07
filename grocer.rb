require "pry"
def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0 
  while i < collection.length do 
    hash_ele = collection[i]
    if hash_ele[:item] == name
      return hash_ele
    end 
    i += 1
  end
  nil
end


def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  result = []
  i = 0 
  p "line22",cart
  puts
  while i < cart.length do
    new_hash = {}
    hash_ele = cart[i]
    # p "line26", hash_ele
    # puts
    item_key = hash_ele[:item]
    #if the key doesn't exist
    # binding.pry
    if !hash_ele[:count]
      # new_hash[:item] = item_key
      # new_hash[:price] = hash_ele[:price].round(2)
      # new_hash[:clearance] = hash_ele[:clearance]
      hash_ele[:count] = 1
    else
      # binding.pry
      hash_ele[:count] += 1
    end 
    # p "line39",new_hash
    result << new_hash
    # p result
    i += 1
  end
  cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  #check coupons to see if :item in coupon is in cart
  #check to see if cart :item has the same :count or more of coupon count
    #if the above is passes, get coupon :price / :count
  # binding.pry
  i = 0 
  while i < coupons.length do 
    hash_ele_coupon = coupons[i]
    item_coupon = hash_ele_coupon[:item]
    count_coupon = hash_ele_coupon[:num]
    j = 0
    while j < cart.length do 
      hash_ele_cart = cart[i]
      item_cart = hash_ele_cart[:item]
      count_cart = hash_ele_cart[:count]
      if item_coupon == item_cart
        if count_cart >= count_coupon
          new_coupon_hash = {}
          discount_price = hash_ele_coupon[:cost] / count_coupon
          new_coupon_hash[:item] = "#{item_cart} W/COUPON"
          new_coupon_hash[:price] = discount_price
          new_coupon_hash[:clearance] = true
          new_coupon_hash[:count] = count_coupon
          
          count_cart = count_cart - count_coupon #=> 3 - 2 = 1
          #update cart
          cart << new_coupon_hash
        end 
      end 
      j += 1
    end 
    i += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
