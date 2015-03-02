require "amatch"
include Amatch

terms = {}

input_file = File.open("words.txt")
input_file.each_slice(2) do |two_lines|
    terms[two_lines[0].strip] = two_lines[1].strip
end

answer = String.new

puts terms

terms = Hash[terms.to_a.sample(terms.length)]
i = 0
right = 0
wrong = 0
total = terms.length
wrong_array = Array.new

terms.each do |key, value|
  i += 1
  m = Sellers.new(key)
  puts i.to_s + ". Definition:\n" + value
  puts "Term:\n"
  answer = gets.chomp
  if ( m.match(answer) < 4.0 )
    right += 1
    puts "Correct! the answer is " + key + "\n\n"
    puts "Score: Right (" + right.to_s + ") Wrong (" + wrong.to_s + "), Total: " + (right/i.to_f*100).to_s + "%\n\n"
  else
    wrong += 1
    wrong_array << key
    puts "Incorrect, the answer is " + key
    puts "Score: Right (" + right.to_s + ") Wrong (" + wrong.to_s + "), Total: " + (right/i.to_f*100).to_s + "%\n\n"
  end
end

puts "Your final score was " + (right/i.to_f*100).to_s + "%\n"
puts "Here are the terms you got WRONG!!! (study these, you big dummy...)\n"
puts wrong_array
