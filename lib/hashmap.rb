# HashMap
class HashMap
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
    @buckets_a.flatten(1).map { |pair| pair[0] }
  end

  def values
    @buckets_a.flatten(1).map { |pair| pair[1] }
  end

  def entries
    @buckets_a.flatten(1)
  end

  def get(key)
    index = hash(key) % @capacity_i
    @buckets_a[index].each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def has?(key)
    get(key).nil? ? false : true
  end

  def set(key, value)
    # getting index to bucket from hash code
    index = hash(key) % @capacity_i

    # Checking if the bucket includes key, swapping the value if so
    found_key = false
    @buckets_a[index].each do |pair|
      if pair[0] == key
        pair[1] = value
        found_key = true
      end
    end

    # If bucket does not already have key, pushing key-value pair
    unless found_key
      @buckets_a[index].push [key, value]
      @entries_i += 1
    end

    # Growing function if entries are exceeding load factor
    return unless @entries_i > @capacity_i * @load_fact_i

    copy_a = entries
    initialize(@capacity_i * 2)
    copy_a.each { |pair| set(pair[0], pair[1]) }
  end

  def remove(key)
    index = hash(key) % @capacity_i # index to bucket
    @buckets_a[index].delete_if { |pair| pair[0] == key }
    @buckets_a
  end

  def to_s
    "  capacity = #{@capacity_i}
  entries = #{@entries_i}
  load_fact = #{@load_fact_i}
  HashMap = #{@buckets_a}"
  end
end
