require_relative 'lib/hashset'

test = HashSet.new

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
p test

test.set('lion')
p test

test.set('moon')
p test

puts test.length

p test.keys

puts test.has?('lion')
puts test.has?('li')

p test.remove('lion')

puts test.clear
p test
