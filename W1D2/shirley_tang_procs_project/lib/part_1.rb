def my_map(arr, &prc)
   new_arr=[]
   arr.each{ |element| new_arr<<prc.call(element)}
   new_arr
end

def my_select(arr, &prc)
    new_arr=[]
    arr.each{ |element| new_arr<<element if prc.call(element)==true }
    new_arr
end

def my_count(arr, &prc)
    count=0
    arr.each{ |element| count+=1 if prc.call(element)==true}
    count
end

def my_any?(arr, &prc)
    if_any=false
    arr.each{ |element| if_any=true if prc.call(element)==true}
    if_any
end

def my_all?(arr, &prc)
    if_all=true
    arr.each{ |element| if_all=false if prc.call(element)!=true}
    if_all
end

def my_none?(arr, &prc)
    if_none=true
    arr.each{ |element| if_none=false if prc.call(element)==true}
    if_none
end