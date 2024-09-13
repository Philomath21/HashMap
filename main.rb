require_relative 'lib/hashmap'

test = HashMap.new

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
p test

test.set('lion', 'silver')
p test

test.set('moon', 'silver')
p test

puts test.length

p test.keys

p test.values

p test.entries

puts test.get('lion')

puts test.has?('lion')

p test.remove('lion')

puts test.clear
p test
