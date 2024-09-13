# HashMap
module HashMapComplimentary
end

class HashMap
  def initialize
    @capacity = 16
    @array_of_buckets = Array.new(@capacity) { Array.new } # rubocop:disable Style/EmptyLiteral
    @entries = 0
    @load_fact = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def get(key)
    # Retrieving index of bucket using hash code
    index = hash(key) % @capacity

    # @array_of_buckets[index] is bucket at index
    # finding key in pairs [key, value] in bucket
    @array_of_buckets[index].each do |pair|
      return pair[1] if pair[0] == key
    end
  end

  def has?(key)
    get(key).nil? ? false : true
  end

  def grow_hashmap
    copy = @array_of_buckets.flatten(1)
    @capacity *= 2
    @array_of_buckets = Array.new(@capacity) { Array.new } # rubocop:disable Style/EmptyLiteral

    copy.each do |pair|
      set(pair[0], pair[1])
    end
  end

  def set(key, value)
    # Retrieving index of bucket using hash code
    index = hash(key) % @capacity

    # @array_of_buckets[index] is bucket at index
    # finding key in pairs [key, value] in bucket
    found_key = false
    @array_of_buckets[index].each do |pair|
      if pair[0] == key
        pair[1] = value
        found_key = true
      end
    end

    unless found_key
      @array_of_buckets[index].push [key, value]
      @entries += 1
    end

    # Growing the hash map if load factor is crossed
    return unless @entries > @capacity * @load_fact

    grow_hashmap
  end

  def to_s
    @array_of_buckets
  end
end
