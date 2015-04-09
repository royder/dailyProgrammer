# easy_202 I AM BENDER. PLEASE INSERT GIRDER.
# http://www.reddit.com/r/dailyprogrammer/comments/2w84hl/20150216_challenge_202_easy_i_am_bender_please/

=begin
GOAL: Take inputs that results in a continuous binary string and convert it to ASCII.
Example Input: "01001000011001010110110001101100011 011110010000001010111011011110111 00100110110001100100"
Example Output: "Hello World"
=end

puts ARGV.join('').split(' ').pack('B*')