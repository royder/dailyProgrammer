# intermediate_181 average speed
# http://www.reddit.com/r/dailyprogrammer/comments/2hcwzn/09242014_challenge_181_intermediate_average_speed/

def file_usable?(filepath)
  return false unless File.exists?(filepath)
  #return false unless File.readable?(filepath)
  return true
end

# Create exercise filepath
filepath = File.join(File.dirname(__FILE__), '..', '..', 'exercise_files', 'intermediate_181_input.txt')

#Check if file exists and abort if not
if !file_usable?(filepath) 
  abort("File (#{filepath}) does not exist. Aborting...")
end

File.open(filepath, 'r') {|file|
  file.each_line {|line|
    cameras = {}
    case
    when line.start_with?('Speed limit')
      /(?<speed_limit>\d+\.\d+)\s(?<speed_unit>mph|kh)/ =~ line
      puts speed_limit
      puts speed_unit
    when line.start_with?('Speed camera number')
      /(?<camera_num>\d).(?<camera_distance>\d+)\s(?<camera_distance_units>\w+)/ =~ line
      puts camera_num
      puts camera_distance
      puts camera_distance_units
    else
      puts 'no match'
    end
  }
}