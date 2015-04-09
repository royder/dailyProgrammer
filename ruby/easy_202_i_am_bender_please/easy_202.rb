# easy_202 I AM BENDER. PLEASE INSERT GIRDER.
# http://www.reddit.com/r/dailyprogrammer/comments/2w84hl/20150216_challenge_202_easy_i_am_bender_please/

=begin
GOAL: Take input that is a continuous binary string and convert it to ASCII.
Example Input: "0100100001100101011011000110110001101111001000000101011101101111011100100110110001100100"
Example Output: "Hello World"
=end

puts ARGV.pack('B*')