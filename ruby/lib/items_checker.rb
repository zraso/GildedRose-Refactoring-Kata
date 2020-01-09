
require 'normal_items'
require 'ageing_items'
require 'legendary_items'
require 'backstage_items'
require 'conjured_items'

class ItemsChecker

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def type
    if item.name == 'Aged Brie' && item.quality < 50
      return AgeingItems.new(item)
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      return BackstageItems.new(item)
    elsif item.name == 'Sulfuras, Hand of Ragnaros'
      return LegendaryItems.new(item)
    elsif item.name == 'Conjured Mana Cake'
      return ConjuredItems.new(item)
    else
      return NormalItems.new(item)
    end
  end
end