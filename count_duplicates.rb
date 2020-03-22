# Complete the countDuplicates function below.
def countDuplicates(numbers)
  dic = Hash.new(0)
  numbers.each_with_object(dic) {|x|
    dic[x] += 1
  }
    .select {|key,value| value > 1}
    .count
end

p countDuplicates([5,5,5,1,2,2,3,3,3,3])
