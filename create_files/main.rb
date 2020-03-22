require 'pp'

def build_structure(file_name)
  basename = File.basename(file_name, ".txt")
  file = File.open(file_name, "r")
  acc = Hash.new {|h, k| h[k] = Array.new}
  file.read.lines.each_with_object(acc) do |line, acc|
    parts = line.split('.')
    file_extention = parts.last.chomp!
    acc[file_extention+"_"+basename].push(line.chomp!)
  end
  ensure file.close
end


def create_files(structure)
  structure.each do |file, content|
    File.open(file, 'w') { |file| file.write(content.join("\n")) }
  end
end

create_files(build_structure("names_list_00.txt"))
