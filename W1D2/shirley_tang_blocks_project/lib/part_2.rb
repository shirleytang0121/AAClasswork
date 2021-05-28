def all_words_capitalized?(arr_words)
    arr_words.all?{|word| word.capitalize==word}
end


def no_valid_url?(arr_url)
    # validend=[".com",".io",".net",".org"]
    # arr_url.none? do |url|
    #     validend.any?{|ending| url.end_with?(ending)}
    # end

    arr_url.none? {|url| url.include?(".com")||url.include?(".net")||url.include?(".io")||url.include?(".og")}
end

def any_passing_students?(students)
    students.any?{|student| student[:grades].sum/student[:grades].length>=75 }
end