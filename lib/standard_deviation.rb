ages = [24, 30, 18, 20, 41]

# Your code here for calculating the standard deviation
ages_sum = ages.sum
ages_count = ages.count
ages_avg = ages.sum.to_f / ages.count
ages_diff = ages.map { |i| (i - ages_avg).round(1) }
ages_diff_squared = ages_diff.map { |i| (i * i).round(2) }
ages_diff_squared_sum = ages_diff_squared.sum
ages_diff_squared_avg = ages_diff_squared.sum / ages.count
std_dev = Math.sqrt(ages_diff_squared_avg).round(2)

# Print out variable values
# puts "ages_sum = #{ages_sum}"
# puts "ages_count = #{ages_count}"
# puts "ages_avg = #{ages_avg}"
# puts "ages_diff = #{ages_diff}"
# puts "ages_diff_squared = #{ages_diff_squared}"
# puts "ages_diff_squared_sum = #{ages_diff_squared_sum}"
# puts "ages_diff_squared_avg = #{ages_diff_squared_avg}"
# puts "std_dev = #{std_dev}"

# When you find the standard deviation, print it out

puts std_dev
