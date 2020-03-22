require 'colorize'

def consecutive(num)
  seq = Array.new
  bin = num / 2
  (1.upto bin).each do |i|
    trace = []
    sum = i
    trace << i
    while sum < num
      trace << (i + 1)
      i += 1
      sum += i
      if sum == num
        seq << trace
      end
    end
  end
  seq
end

def testConsecutive(seq, exp)
  return "#{exp}: ".blue + "#{seq}".green if seq.reduce(:+) == exp
  fail if seq.reduce(:+) != exp
end

store = Hash.new
(1..ARGV[0].to_i).each do |num|
  sequences = consecutive num
  sequences.each do |s|
    store[s] = num
    puts testConsecutive(s, num)
  end
end

sorted_seq = store.sort_by {|k,v| k.count}
puts "\nLongest Sequences:".blue

longest_seq = sorted_seq[-1].first.count
longest_seqs = sorted_seq.select{|k,v| k.count == longest_seq}
longest_seqs.each do |s|
  puts "#{s.last}: ".blue + "#{s.first}".red
end
