# Open first file, read it, store it, then close it
input = File.open(ARGV[0]) {|f| f.read() }

# Open second file, write to it, then close it
output = File.open(ARGV[1], 'w') {|f| f.write(input) }