def hash_mapped(hash, prc1, &prc2 )
    new_hash={}
    hash.each do |k,v|
        new_hash[prc2.call(k)]=prc1.call(v)
    end
    new_hash
end


double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}