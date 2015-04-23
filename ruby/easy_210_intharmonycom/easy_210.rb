# easy_210 intharmony.com
# http://www.reddit.com/r/dailyprogrammer/comments/32goj8/20150413_challenge_210_easy_intharmonycom/

def get_input_convert_binary(bits)
  print "Input a decimal: "
  loop do
    input = gets.chomp
    if !(input =~ /\d+/)
      print "Input was not a decimal, try again: "
    else
      return input, input.to_i.to_s(2).rjust(bits, '0')
    end
  end
end

def determine_match(x, y, bits)
  # Could potentially use this gem: https://rubygems.org/gems/similar_text; or convert input to arrays
  #   and use each_with_index
  # This could also potentially be done with logic (x & y) | ((max-x)&(max-y)) or !(x ^ y)
  bits_matching = x.each_char.zip(y.each_char).find_all {|a,b| a==b}.size
  percentage_match = (bits_matching.to_f / bits * 100).round(3)
end


def determine_opposite(input_int, bits)
  max_int = ('1'*bits).to_i(2)
  max_int - input_int.to_i
end

bits = 32
x_dec, x_bin = get_input_convert_binary
y_dec, y_bin = get_input_convert_binary

puts "#{determine_match(x_bin, y_bin, bits)}% Compatibility"
puts "#{x_dec} should avoid #{determine_opposite(x_dec, bits)}"
puts "#{y_dec} should avoid #{determine_opposite(y_dec, bits)}"