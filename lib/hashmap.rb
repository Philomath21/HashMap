# HashMap
class HashMap
  def initialize(capacity = 16, load_fact = 0.75)
    @capacity = capacity
    @array_of_buckets = Array.new(@capacity) { [] }
    @entries_i = 0
    @load_fact = load_fact
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
    nil
  end

  def has?(key)
    get(key).nil? ? false : true
  end

  def set(key, value)
    # getting index to bucket from hash code
    index = hash(key) % @capacity

    # Checking if the bucket includes key, swapping the value if so
    found_key = false
    @array_of_buckets[index].each do |pair|
      if pair[0] == key
        pair[1] = value
        found_key = true
      end
    end

    # If bucket does not already have key, pushing key-value pair
    unless found_key
      @array_of_buckets[index].push [key, value]
      @entries_i += 1
    end

    # Growing function if entries are exceeding load factor
    return unless @entries_i > @capacity * @load_fact

    copy_a = @array_of_buckets.flatten(1)
    initialize(@capacity * 2)
    copy_a.each { |pair| set(pair[0], pair[1]) }
  end

  def remove(key)
    index = hash(key) % @capacity # index to bucket
    @array_of_buckets[index].delete_if { |pair| pair[0] == key }
    @array_of_buckets
  end

  def to_s
    @array_of_buckets
  end
end
