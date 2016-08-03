class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(item_id)
    @contents[item_id.to_s] ||= 0
    @contents[item_id.to_s] += 1
  end

  def total_items
    contents.values.sum
  end

  def total_cost
    if contents.empty?
      0.00
    elsif contents.values.max < 2
      Item.find(contents.keys).pluck(:price).sum
    else
      process_sum
    end
  end

  def all_items
    contents.map do |item_id, quantity|
      CartItem.new(item_id, quantity)
    end
  end

  private

  def process_sum
    all_items.reduce(0) do |initial, item|
      initial += item.sub_total
    end
  end

end
