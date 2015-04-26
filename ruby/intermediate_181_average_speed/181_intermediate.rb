# intermediate_181 average speed
# http://www.reddit.com/r/dailyprogrammer/comments/2hcwzn/09242014_challenge_181_intermediate_average_speed/

require 'time'

def file_usable?(filepath)
  return false unless File.exists?(filepath)
  return false unless File.readable?(filepath)
  return true
end

# Create exercise filepath
filepath = File.join(File.dirname(__FILE__), '..', '..', 'exercise_files', 'intermediate_181_input.txt')

#Check if file exists and abort if not
if !file_usable?(filepath) 
  abort("File (#{filepath}) does not exist. Aborting...")
end

vehicles = Hash.new {|h,k| h[k]=[]}
cameras_distances = Hash.new
speed_limit = nil

File.open(filepath, 'r').each {|line|
  case
  when line.start_with?('Vehicle')
    /Vehicle (?<vehicle_id>[0-9A-Z]{1,4} [0-9A-Z]{1,4}) passed camera (?<camera_num>[1-9]) at (?<camera_time>[0-9]{2}:[0-9]{2}:[0-9]{2})\./ =~ line
    if vehicles.has_key?(vehicle_id)
      distance = (cameras_distances[camera_num] - vehicles[vehicle_id][1]) * 0.00062137
      time = (Time.parse(camera_time) - Time.parse(vehicles[vehicle_id][0])) / 60 / 60
      speed = distance / time
      puts "Vehicle #{vehicle_id} broke the speed limit by #{(speed - speed_limit).round(1)} mph." if speed > speed_limit
      vehicles[vehicle_id] = [camera_time, cameras_distances[camera_num]]
    else
      vehicles[vehicle_id] = [camera_time, cameras_distances[camera_num]]
    end
  when line.start_with?('Speed limit')
    # Assigns speed_limit and speed_unit
    /Speed limit is (?<speed_limit>[1-9][0-9]\.[0-9]{2}) (?<speed_unit>mph|kmh)\./ =~ line
    speed_limit *= 0.62137 if speed_unit == 'kmh'
    speed_limit = speed_limit.to_i
  when line.start_with?('Speed camera number')
    # Assigns camera_num and camera_distance
    /Speed camera number (?<camera_num>[1-9]) is (?<camera_distance>0|[1-9][0-9]{0,3}) metres down the motorway\./ =~ line
    cameras_distances[camera_num] = camera_distance.to_i
  when line.start_with?('Start of log for')
    next 
  else
    abort("Could not process the following file line: #{line}). Aborting...")
  end
}