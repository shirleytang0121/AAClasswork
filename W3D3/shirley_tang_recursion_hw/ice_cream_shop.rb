 def ice_cream_shop(flavor_arr,flavor)
    return false if flavor_arr.length==0
    return true if flavor_arr[0]==flavor

    ice_cream_shop(flavor_arr[1..-1],flavor)
 end
 
 
 
 # Test Cases
 p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
 p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
 p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
 p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
 p ice_cream_shop([], 'honey lavender')  # => returns false