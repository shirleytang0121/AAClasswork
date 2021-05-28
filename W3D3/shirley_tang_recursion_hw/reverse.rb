 def reverse(str)
    return str if str.length==1 || str.length==0
    str[-1]+=reverse(str[0...-1])
 end
 
 
 # Test Cases
 p reverse("house") # => "esuoh"
 p reverse("dog") # => "god"
 p reverse("atom") # => "mota"
 p reverse("q") # => "q"
 p reverse("id") # => "di"
 p reverse("") # => ""