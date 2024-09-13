# HashMap
class HashSet
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
    @array_of_buckets.flatten
  end

  def has?(key)
    index = hash(key) % @capacity

    @array_of_buckets[index].each do |key_in_bucket|
      return true if key_in_bucket == key
    end
    false
  end

  def set(key)
    # getting index to bucket from hash code
    index = hash(key) % @capacity

    # Checking if the bucket includes key, swapping the value if so
    return if @array_of_buckets[index].include? key

    # If bucket does not already have key, pushing key-value pair
    @array_of_buckets[index].push key
    @entries_i += 1

    # Growing function if entries are exceeding load factor
    return unless @entries_i > @capacity * @load_fact

    copy_a = @array_of_buckets.flatten
    initialize(@capacity * 2)
    copy_a.each { |key_in_set| set(key_in_set) }
  end

  def remove(key)
    index = hash(key) % @capacity # index to bucket
    @array_of_buckets[index].delete key
    @array_of_buckets
  end

  def to_s
    "  capacity = #{@capacity}
  entries_i = #{@entries_i}
  load_fact = #{@load_fact}
  HashMap = #{@array_of_buckets}"
  end
end
