require_relative 'lib/hashmap'

def print_hashmap(test)
  puts test
  puts ' '
end

puts 'Creating new HashMap object'
test = HashMap.new
print_hashmap(test)

puts 'Adding 12 key-value pairs to HashMap using #set(key, value)'
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
print_hashmap(test)

puts "#set('lion', 'silver') : lion key already exists, so size shouldn't increase"
test.set('lion', 'silver')
print_hashmap(test)

puts "#set('moon', 'silver') : new key entered. Load factor exceeded, size of HashMap should double & pairs should be
reassigned to new buckets "
test.set('moon', 'silver')
print_hashmap(test)

puts "#keys = #{test.keys}"
puts "#values = #{test.values}"
puts "#entries = #{test.entries}"
puts ' '

puts "#get('lion') : #{test.get('lion')}, (lion key exists)"
puts "#get('li') : #{test.get('li')}, (li key doesn't exist)"
puts ' '

puts "#has?('lion') : #{test.has?('lion')}, (lion key exists)"
puts "#has?('li') : #{test.has?('li')}, (li key doesn't exist)"
puts ' '

test.remove('lion')
puts "#remove('lion') : pair with lion key will be removed, also, size of the HashMap will drop below the load factor.
This should halve the size of HashMap & reassign the pairs into newly created buckets."
print_hashmap(test)

test.clear
puts '#clear : This should clear the HashMap. Hence it will again have 16 empty buckets, as a new HashMap object'
print_hashmap(test)
