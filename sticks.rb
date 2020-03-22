# Complete the cutSticks function below.
#
# Find the smallest stick and delete it from the array
# then substract it's length from the rest of the sticks
# and repeat until you have one stick.
#
def cutSticks(lengths)
  return 1 if lengths.size  == 1

  smallest = lengths.sort.first
  puts "#{lengths} | smallest is: #{smallest}"
  lengths.delete(smallest)
  lengths.map! {|e| e - smallest }
  cutSticks(lengths)

  return lengths
end

p cutSticks [5,8,6,9,3,1]
