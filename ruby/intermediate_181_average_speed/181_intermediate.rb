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
    cameras_distances = Hash.new
    vehicles = Hash.new{|h,k| h[k]=[]}
    case
    when line.start_with?('Speed limit')
      /Speed limit is (?<speed_limit>[1-9][0-9]\.[0-9]{2}) (?<speed_unit>mph|kmh)\./ =~ line
      puts speed_limit
      puts speed_unit
    when line.start_with?('Speed camera number')
      /Speed camera number (?<camera_num>[1-9]) is (?<camera_distance>0|[1-9][0-9]{0,3}) metres down the motorway\./ =~ line
      cameras_distances[camera_num] = camera_distance.to_i
      puts cameras_distances.inspect
    when line.start_with?('Start of log for')
      next 
    when line.start_with?('Vehicle')
      /Vehicle (?<vehicle_id>[0-9A-Z]{1,4} [0-9A-Z]{1,4}) passed camera (?<camera_num>[1-9]) at (?<time>[0-9]{2}:[0-9]{2}:[0-9]{2})\./ =~ line
      vehicles[vehicle_id.gsub(/\s/,'')] << [camera_num, time]
      puts vehicles.inspect
    else
      puts 'no match'
    end
  }
}