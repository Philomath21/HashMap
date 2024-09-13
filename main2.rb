require_relative 'lib/hashset'

def print_hashset(test)
  puts test
  puts ' '
end

puts 'Creating new HashSet object'
test = HashSet.new
print_hashset(test)

puts 'Adding 12 keys to HashSet using #set(key)'
test.set('apple')
test.set('banana')
test.set('carrot')
test.set('dog')
test.set('elephant')
test.set('frog')
test.set('grape')
test.set('hat')
test.set('ice cream')
test.set('jacket')
test.set('kite')
test.set('lion')
print_hashset(test)

puts "#set('lion') : lion key already exists, so size shouldn't increase"
test.set('lion')
print_hashset(test)

puts "#set('moon') : new key entered. Load factor exceeded, size of HashSet should double & pairs should be
reassigned to new buckets "
test.set('moon')
print_hashset(test)

puts "#keys = #{test.keys}"
puts ' '

puts "#has?('lion') : #{test.has?('lion')}, (lion key exists)"
puts "#has?('li') : #{test.has?('li')}, (li key doesn't exist)"
puts ' '

test.remove('lion')
puts "#remove('lion') : lion key will be removed, also, size of the HashSet will drop below the load factor.
This should halve the size of HashSet & reassign the keys into newly created buckets."
print_hashset(test)

test.clear
puts '#clear : This should clear the HashSet. Hence it will again have 16 empty buckets, as a new HashSet object'
print_hashset(test)
