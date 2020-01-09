class NormalItems

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_quality
    item.quality -= 1 if item.quality > 0
    item.quality -= 1 if item.quality > 0 && item.sell_in < 0
  end

  def update_sell_in
    item.sell_in -= 1
  end

end