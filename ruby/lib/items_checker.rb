
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

  def generate_type

    types = {
      "Aged Brie" => AgeingItems,
      "Backstage passes to a TAFKAL80ETC concert" => BackstageItems,
      "Sulfuras, Hand of Ragnaros" => LegendaryItems,
      "Conjured Mana Cake" => ConjuredItems
    }

    if types[item.name].nil?
      return NormalItems.new(item)
    else
      return types[item.name].new(item)
    end
  end
end