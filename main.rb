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

[
  [],
  [%w[elephant gray]],
  [],
  [%w[carrot orange]],
  [%w[frog green]],
  [%w[banana yellow]],
  [],
  [],
  [],
  [],
  [%w[apple red]],
  [%w[grape purple], %w[hat black]],
  [%w[dog brown], %w[lion golden]],
  [['ice cream', 'white']],
  [%w[jacket blue]],
  [%w[kite pink]]
]
