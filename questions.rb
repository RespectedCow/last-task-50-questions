require 'date'

# Return the next number of the given integer
def next_number(num)
    return num += 1
end

# Minutes into seconds
def minutes_into_seconds(minutes)
    return minutes * 60
end

# Return first element in an array
def get_first_element(arr)
    return arr.first()
end

# Return integer from string
# Return 0 if it is invalid
def string_to_integer(str)
    return str.to_i
end

# Return true if number is more than 0
# Return false if number is less than or equal to 0
# Return 'undefined' if it is invalid
def positive_number(num)
    if num.class == String
        return 'undefined'
    end
    if num > 0
        return true
    elsif num <= 0
        return false
    end
end

# Reverse a given string
def reverse(str)
    return str.reverse()
end

# Return true if sum of two numbers is more than 100, else false
def more_than_100(num1, num2)
    if num1 + num2 > 100
        return true
    else
        return false
    end
end

# Return the unique number in an array
def unique_number(arr)
    existing_numbers = []
    not_unique = []
    arr.each do |entry|
        if existing_numbers[entry] === nil
            existing_numbers[entry] = true
        else
            not_unique[entry] = true
        end
    end
    arr.each do |entry|
        if not_unique[entry] == nil
            return entry
        end
    end
end

# Return the length of nested array
def get_length(arr)
    $index = 0
    def reroute(arr)
        arr.each do |entry| # bad because if array then the remaining numbers will not be counted but works
            if entry.class != Array 
                $index += 1
            else 
                reroute(entry)
            end
        end 
    end
    reroute(arr)
    return $index
end

# keep only the elements that start with an a
def select_elements_starting_with_c(arr)
    return_array = []
    index = 0
    arr.each do |entry|
        if entry[0] == "c"
            return_array.insert(index, entry)
            index += 1
        end
    end
    return return_array
end

# Remove instances of nil (but NOT false) from an array
def remove_nils_from_array(arr)
    reformed_array = []
    index = 0
    arr.each do |entry|
        if entry != nil 
            reformed_array.insert(index, entry)
            index += 1
        end
    end 
    return reformed_array
end

# Remove instances of nil AND false from an array
def remove_nils_and_false_from_array(arr)
    reformed_array = []
    index = 0
    arr.each do |entry|
        if entry != nil  && entry != false
            reformed_array.insert(index, entry)
            index += 1
        end
    end 
    return reformed_array
end

# Reverse every word in an array and return it
def reverse_every_element_in_array(arr)
    reformed_array = []
    index = 0
    arr.each do |entry|
        reformed_array.insert(index, entry.reverse())
        index += 1
    end
    return reformed_array
end

# Return each possible pairing outcome in an array
def every_possible_pairing_of_word(arr)
    reformed_array = []
    index = 0
    arr.each do |entry|
        arr.each do |entry2|
            if reformed_array.include? [entry, entry2]
            
            elsif reformed_array.include? [entry2, entry]
            elsif entry != entry2 
                reformed_array.insert(index, [entry, entry2])
                index += 1
            end
        end
    end
    return reformed_array
end

# Turn an array of numbers into two arrays of numbers
# First array in the array is all even numbers
# Second array in the array is all odd numbers
def separate_arr_into_even_and_odd_num(arr)
    odd_array = []
    even_array = []
    odd_index = 0
    even_index = 0
    arr.each do |number|
        if number % 2 == 0
            even_array.insert(odd_index, number)
            even_index += 1
        else
            odd_array.insert(odd_index, number)
            odd_index += 1
        end
    end

    # remove nils
    index = 0
    for num in even_array
        if num == nil
            even_array.delete(num)
        end

        index += 1
    end

    return [even_array, odd_array]
end

# Sorting string by last alphabet/character
def sort_by_last_char(str)
    words = str.split()

    last_chars = []

    send_back_array = []

    not_index = 0
    for word in words
        last_chars.insert(not_index, word[-1])

        not_index += 1
    end

    print(last_chars)

    reformed_array = last_chars.sort
    print(reformed_array)

    index = 0
    for char in reformed_array
        for word in words
            if word[-1] == char
                send_back_array.insert(index, word)
            end
        end

        index += 1
    end

    sendback = ""

    index = 0
    for word in send_back_array
        if index != 0
            sendback = sendback + " #{word}"
        else
            sendback = word
        end

        index += 1
    end

    return sendback
end

# Serving drinks to people above age 18 and older, and when not on break time
# Return true if age is equal and above 18, when not on break time
# Return false if age is equal and above 18, when on break time
# Return false if age is below 18
def serve_drink(age, onBreak)
    if onBreak == false 
        if age >= 18
            return true
        end
    else
        if age >= 18
            return false
        end
    end

    if age < 18
        return false
    end
end

# Sum an array by the first (n) numbers
def sum_numbers(arr, n)
    sum = 0
    index = 0

    arr.each do |i|
        if index != n    
            sum += i
        else
            return sum
        end

        index += 1
    end
end

# String to binary, range from a-m will be 0, range from n-z will be 1
def string_to_binary(str)
    zero_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]
    one_array = ["n" , "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    def check_if_in_array(check, array)
        array.each do |i|
            if check.upcase == i.upcase
                return true
            end
        end

        return false
    end

    return_word = ""

    for char in str.chars
        if check_if_in_array(char, zero_array)
            return_word = return_word + "0"
        elsif check_if_in_array(char, one_array)
            return_word = return_word + "1"
        end
    end

    return return_word
end

# Find missing numbers range from 1 to 10 in an array
def find_the_missing_numbers(arr)
    example = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    send_back = []

    index = 0
    example.each do |num|
        if arr.include? num
            
        else
            send_back.insert(index, num)

            index += 1
        end
        
    end

    return send_back
end

# Swap two digits and see if it is larger than the one swapped
# Return true if it is larger than the one swapped
# Return false if it is smaller than the one swapped
def compare_number_after_swap(num)
    swap_num = num.to_s

    swap_num = swap_num.reverse()

    return swap_num[1].to_i > swap_num[0].to_i
end

# Return index of the first vowel
def index_of_the_first_vowel(str)
    vowels_array = ["a", "e", "i", "o", "u"]

    def check_if_in_array(check, array)
        array.each do |i|
            if check.upcase == i.upcase
                return true
            end
        end

        return false
    end
    
    index = 0
    str.chars.each do |i|
        if check_if_in_array(i, vowels_array)
            return index
        end

        index += 1
    end
end

# Return sum of two largest numbers in array
def sum_of_two_largest_numbers(arr)
    sum = 0

    sum += arr.max
    arr.delete(arr.max)

    sum += arr.max

    return sum
end

# Return sum of two smallest numbers in array
def sum_of_two_smallest_numbers(arr)
    sum = 0

    sum += arr.min
    arr.delete(arr.min)

    sum += arr.min

    return sum
end

# Return sum of positive number
def sum_of_positive(arr)
    sum = 0
    arr.each do |num|
        if num >= 0
            sum += num 
        end
    end

    return sum
end

# Return sum of negative number
def sum_of_negative(arr)
    sum = 0
    arr.each do |num|
        if num < 0
            sum += num 
        end
    end

    return sum
end

# Sum positive number, count negative number
def sum_positive_count_negative(arr)
    sum = 0
    neg_count = 0
    arr.each do |num|
        if num >= 0
            sum += num 
        else
            neg_count += 1
        end
    end

    return [sum, neg_count]
end

# Count positive number, sum negative number
def count_positive_sum_negative(arr)
    sum = 0
    neg_count = 0
    arr.each do |num|
        if num >= 0
            neg_count += 1
        else
            sum += num
        end
    end

    return [neg_count, sum]
end

# Return file extention from files
def get_file_extension(arr)
    file_type_array = []

    index = 0
    for file in arr
        splited = file.split(".")

        file_type_array.insert(index, splited[1])

        index += 1
    end

    return file_type_array
end

# Validation Zip code format
def validation_of_zip_code(code)

    # check type
    for str in code.chars
        if !/\A\d+\z/.match(code)
            return false
        end  
    end

    # check length
    if code.length == 5
        return true
    else
        return false
    end
end

# Keeps only strings with repeating identical characters
def filter_repeated_character_strings(arr)
    results = []

    index = 0
    arr.each do |word|
        char_index = 0
        main_char = ""
        other_char = false

        word.chars.each do |char|
            char_index += 1

            if char_index == 1
                main_char = char
            end
            if main_char != "" && char == main_char
                if char_index == word.length && other_char == false
                    results.insert(index, word)

                    index += 1
                end
            else
                other_char = true
            end
        end
    end

    return results
end

# Rock Paper Scissors
def rock_paper_scissors(player_1, player_2)
    patterns = [["Rock", "Scissors", true], ["Scissors", "Paper", false], ["Paper", "Rock", true], ["Scissors", "Rock", false], ["Paper", "Scissors", true], ["Paper", "Rock", false]]
    #Tie
    if player_1 == player_2
        return "It's a draw!"
    else
        patterns.each do |pat| 
            if player_1 == pat[0] && player_2 == pat[1]
                if pat[2] == true
                    return "Player 1 wins!"
                else
                    return "Player 2 wins!"
                end
            end
        end
    end
end

# Get the final price after applying discount
def price_after_discount(price, discount)
    return price - discount * (price / 100)
end

# Order above 100 to eligible for free shipping
def check_for_eligible_of_free_shipping(order)
    order.each do |key, price|
        if price > 100
            return true
        else
            return false
        end        
    end
end

# Return the first found longest word
def get_the_longest_word(str)
    words = str.split()
    longest = [0, ""]

    for word in words
        if word.length > longest[0]
            longest[0] = word.length
            longest[1] = word
        end
    end

    print(longest[1])
    return longest[1]
end

# Return the first found shortest word
def get_the_shortest_word(str)
    words = str.split()
    return words.max
end

# Check if a month in a particular year contains a Sunday 7th
def has_sunday_with_date_7(month, year)
    calender = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    day_count = 0

    calender.each do |num|
        (1..num).each do |i|
            if i == 7 && day_count = 7
                return true
            end
            if day_count <= 7
                day_count += 1
            else
                day_count = 7
            end
        end
    end
end

# Filter array with strings and integers, return strings only
def filter_out_integers(arr)
    reformed_array = []

    index = 0
    arr.each do |value|
        if value.is_a? String
            reformed_array.insert(index, value)

            index += 1
        end
    end

    return reformed_array
end

# Filter array with strings and integers, return integers only
def filter_out_strings(arr)
    reformed_array = []

    index = 0
    arr.each do |value|
        if value.is_a? Integer
            reformed_array.insert(index, value)

            index += 1
        end
    end

    return reformed_array
end

# Get the next alphabet of every letter of a word
def the_next_alphabet(word)
    alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n" , "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    return_word = ""

    word.chars.each do |char|
        index = alphabets.find_index(char.downcase)
        return_word = return_word + alphabets[index + 1]
    end

    return_word[0] = return_word[0].upcase

    return return_word
end

# Count each alphabet 'X', 'Y', 'Z' from a given string
def calculate_alphabet(word)
    x_count = 0
    y_count = 0
    z_count = 0

    word.chars.each do |char|
        if char == "X"
            x_count += 1
        elsif char == "Y"
            y_count += 1
        elsif char == "Z"
            z_count += 1
        end
    end

    return [x_count, y_count, z_count]
end

# Capitalize first letter of each word
def capitalize_letter_of_each_word(str)
    return_string = ""
    words = str.split()

    index = 0
    words.each do |word|
        word[0] = word[0].upcase
        index += 1
        if index >= 2
            return_string = return_string + " #{word}"
        elsif index < 2
            return_string = word
        end
    end

    return return_string
end

# Reverse words which have even length
def reverse_even_words(str)
    return_string = ""

    words = str.split()

    index = 0
    words.each do |word|
        index += 1
        if word.length&1==0
            if index >= 2
                return_string = return_string + " #{word.reverse}"
            elsif index < 2
                return_string = word.reverse
            end
        else
            if index >= 2
                return_string = return_string + " #{word}"
            elsif index < 2
                return_string = word
            end
        end
    end

    return return_string
end

# Sorting an array with 'asc', 'dsc', 'none'
def sorting_an_array(arr, order)
    order_array = []

    index = 0
    order.chars.each do |char|
        order_array.insert(index, char)
        index += 1
    end

    if order == "none"
        return arr
    else
        if order == "dsc"
            return arr.sort {|a,b| b <=> a}
        elsif order == "asc"
            return arr.sort
        end
        
    end
end

# Return an array of index of small letter
def index_of_small_letter(word)
    return_array = []

    def which_case(letter)
        case letter
        when /[[:upper:]]/ then return 'uppercase'
        when /[[:lower:]]/ then return 'lowercase'
        else return 'other'
        end
    end

    index = 0
    word.chars.each do |char|
        if /[[:lower:]]/ =~ char
            return_array[index] = index
        end

        index += 1
    end

    # remove nils
    index = 0
    for num in return_array
        if num == nil
            return_array.delete(num)
        end

        index += 1
    end

    return return_array
end

# Word Spelling
def word_spelling(word)
    array = []

    sent_word = ""
    
    index = 0
    word.chars.each do |char|
        sent_word = sent_word + char
        array.insert(index, sent_word)
        index += 1
    end

    return array
end

# Sum up only numbers in an array
def sum_up_numbers(arr)
    sum = 0
    arr.each do |num|
        if num.is_a? Integer
            sum += num
        end
    end
    return sum
end

# Perform operation of 4 types, if divided by 0 then is undefined
# Add, Subtract, Multiply, Divide
def operation_of(a, b, op)
    if op ==  "add"
        return a + b
    elsif op == "subtract"
        return a - b    
    elsif op == "multiply"
        return a * b   
    elsif op == "divide"
        if b == 0
            return "undefined"
        else
            return a / b
        end
    end
end

# Hashtag generator
# Start with a hashtag
# Capitalized first letter for each word
# Return false if empty string or more than 30 characters
def hashtag(str)
    return_string = "#"
    words = str.split()

    words.each do |word|
        word_index = 0
        word.chars.each do |char|
            if word_index == 0
                return_string = return_string + char.upcase
            else
                return_string = return_string + char
            end

            word_index += 1
        end
    end

    if return_string == "#"
        return false
    elsif str.length > 30
        return false
    end

    return return_string
end

# Reformat date to be [MM, DD, YYYY]
def date_reformatting(date)
    month = [["January", 1], ["February", 2], ["March", 3], ["April", 4], ["May", 5], ["December", 12], ["Dec", 12]]
    data = date.split(" ")
    if data.length == 1
        data = data[0].split("-")
    end
    if data.length == 1
        data = data[0].split(".")
    end
    if data.length == 1
        data = data[0].split("/")
    end
    
    send_back = []

    month.each do |moth|
        if moth[0] = data[0]
            send_back[0] = moth[1].to_i
        end
    end

    send_back[1] = data[1].tr(",", " ").to_i
    send_back[2] = data[2].to_i

    return send_back
end