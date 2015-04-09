# easy_182 The Column Conundrum
# http://www.reddit.com/r/dailyprogrammer/comments/2hssx6/29092014_challenge_182_easy_the_column_conundrum/

=begin
  GOAL: Take in arguments for formatting text on first line and file with text to
  format on the rest.
=end

# Get exercise filename
input_filename = File.join(File.dirname(__FILE__), '..', 'exercise_files', 'easy_182_input.txt')
output_filename = File.join(File.dirname(__FILE__), '..', 'exercise_files', 'easy_182_output.txt')

#Check if file exists and abort if not
if !File.exists?(input_filename) 
  abort("File (#{input_filename}) does not exist. Aborting...")
else
  input_file = File.open(input_filename, 'r')
end

#Get output format from first line of file
number_of_columns, column_width, space_width = input_file.readline.split(' ').map {|s| s.to_i}

#Read the rest of the file to determine the number of lines
words = []
while line = input_file.gets
  (words << line.split(' ')).flatten!
end

#Put the max number of words in each line
lines = []
while words.count > 0 
  line = ''
  loop do
    break if words.count == 0 || line.length+words[0].length > column_width
	if line.length+words[0].length < column_width
	  line << "#{words.shift} "
	elsif 
	  line << "#{words.shift}"
	end
  end
  lines.push(line.ljust(column_width))
end

total_lines_per_col = lines.count / number_of_columns

output_file = File.new(output_filename, 'w')

(0..total_lines_per_col-1).each {|line_num|
  (1..number_of_columns).each {|col_num|
      if col_num == 1
        output_file.print(lines[line_num], ' '*space_width)
      elsif 
	    output_file.print(lines[line_num+(total_lines_per_col*(col_num-1))], ' '*space_width)
      end
    }
  output_file.puts
}
output_file.close