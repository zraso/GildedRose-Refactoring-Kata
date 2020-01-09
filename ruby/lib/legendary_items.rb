class LegendaryItems

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_quality
    item.quality = item.quality
  end

  def update_sell_in
    item.sell_in = item.sell_in
  end

end