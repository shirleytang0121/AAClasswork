require "byebug" 

def zip (*arrs)
   # #actually doing transpose in matrix
    new_outer=[]
    i=0
    while i<arrs[0].length
        new_inner=[]
        arrs.each do |subs|
            new_inner<<subs[i]
        end
        i+=1
        new_outer<<new_inner
    end
    new_outer
end

def prizz_proc(arr, prc1,prc2)
    newarr=[]
    arr.each do |num|
        if (prc1.call(num)&&!prc2.call(num))|| (!prc1.call(num)&&prc2.call(num))
            newarr<<num
        end
    end
    newarr
end

def zany_zip(*arrays)
    max=0
    arrays.each do |array|
        if array.length>max
            max=array.length
        end
    end
    i=0
    new_outer=[]
    while i<max
        new_inner=[]
        arrays.each do |array|
            new_inner<<array[i]
        end
        new_outer<<new_inner
        i+=1
    end
    new_outer
end


def maximum(arr, &prc)
    max=0
    i=0
    arr.each_with_index do |ele,idx|
        if prc.call(ele)>=max
            max=prc.call(ele)
            i=idx
        end
    end
    return arr[i]
end


def my_group_by(arr,&prc)
    hash={}
    arr.each do |ele|
        key=prc.call(ele)
        if hash.has_key?(key)
            hash[key]<<ele
        else
            hash[key]=[ele]
        end
    end
    hash
end


def max_tie_breaker(arr, prc1, &prc2)
    return nil if arr.length==0
    max1=maximum(arr, &prc2)
    tie1=tie_value(arr,max1,prc1,&prc2)
    if tie1.length==1
        return max1
    else
        max2=maximum(tie1,&prc1)
    end

    tie2=tie_value(arr,max2,prc1,&prc2)
    if tie2.length==1
        return max2
    else
        return tie2[0]
    end
      
end

def tie_value(arr,max,prc1,&prc2)
    tie=[max]
    arr.each do |ele| 
        if prc2.call(ele)==prc2.call(max) &&(ele!=max) 
             tie<<ele
        end
     end
    tie
end




def silly_syllables(sentence)
   words=sentence.split(" ")
   new_sentence=[]
   words.each do |word|
        new_sentence<<new_word(word)
   end
   new_sentence.join(" ")  
end



def new_word(word)
    vowel="aeiou"
    start_idx=0
    end_idx=word.length-1
    #debugger
    word.each_char.with_index do |char,idx|
        if vowel.include?(char)
            start_idx=idx
            break
        end
    end

    word.reverse.each_char.with_index do |char,idx|
        if vowel.include?(char)
            end_idx=word.length-idx-1
            break
        end
    end
    
    if start_idx==end_idx
        start_idx=0
        end_idx=word.length-1
    end

    return word[start_idx..end_idx]

end


