# HashMap
class HashSet
  def initialize(capacity = 16, load_fact = 0.75)
    @capacity_i = capacity
    @buckets_a = Array.new(@capacity_i) { [] }
    @entries_i = 0
    @load_fact_i = load_fact
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
    @buckets_a.flatten
  end

  def has?(key)
    index = hash(key) % @capacity_i
    @buckets_a[index].each { |bucket_key| return true if bucket_key == key }
    false
  end

  def set(key)
    # getting index to bucket from hash code
    index = hash(key) % @capacity_i

    # Checking if the bucket includes key, exiting the function without doing anything
    return if @buckets_a[index].include? key

    # If bucket does not already have key, pushing key
    @buckets_a[index].push key
    @entries_i += 1

    # Growing function if entries are exceeding load factor
    return unless @entries_i > @capacity_i * @load_fact_i

    copy_a = keys
    initialize(@capacity_i * 2)
    copy_a.each { |stored_key| set(stored_key) }
  end

  def remove(key)
    index = hash(key) % @capacity_i # index to bucket
    @buckets_a[index].delete key
    @buckets_a
  end

  def to_s
    "  capacity = #{@capacity_i}
  entries = #{@entries_i}
  load_fact = #{@load_fact_i}
  HashSet = #{@buckets_a}"
  end
end
