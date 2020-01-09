require 'ageing_items'

class BackstageItems < AgeingItems

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_quality
    super
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality -= item.quality if item.sell_in < 0
  end

end