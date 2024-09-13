# HashMap
module HashMapComplimentary
end

class HashMap
  def initialize
    @capacity = 16
    @array_of_buckets = Array.new(@capacity) { Array.new } # rubocop:disable Style/EmptyLiteral
    @entries_i = 0
    @load_fact = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def length
    @entries_i
  end

  def clear
    initialize
  end

  def keys
    @array_of_buckets.flatten(1).map { |pair| pair[0] }
  end

  def values
    @array_of_buckets.flatten(1).map { |pair| pair[1] }
  end

  def entries
    @array_of_buckets.flatten(1)
  end

  def get(key)
    index = hash(key) % @capacity

    @array_of_buckets[index].each do |pair|
      return pair[1] if pair[0] == key
    end
  end

  def has?(key)
    index = hash(key) % @capacity

    @array_of_buckets[index].each do |pair|
      return true if pair[0] == key
    end
    false
  end

  def grow_hashmap
    copy = @array_of_buckets.flatten(1)
    @capacity *= 2
    @array_of_buckets = Array.new(@capacity) { Array.new } # rubocop:disable Style/EmptyLiteral
    @entries_i = 0

    copy.each do |pair|
      set(pair[0], pair[1])
    end
  end

  def set(key, value)
    index = hash(key) % @capacity

    found_key = false
    @array_of_buckets[index].each do |pair|
      if pair[0] == key
        pair[1] = value
        found_key = true
      end
    end

    unless found_key
      @array_of_buckets[index].push [key, value]
      @entries_i += 1
    end

    grow_hashmap if @entries_i > @capacity * @load_fact
  end

  def remove(key)
    index = hash(key) % @capacity
    @array_of_buckets[index].delete_if { |pair| pair[0] == key }
    @array_of_buckets
  end

  def to_s
    @array_of_buckets
  end
end
