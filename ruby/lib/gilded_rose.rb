# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_sell_in(item)
      update_brie_quality(item) if brie?(item)
      update_backstage_quality(item) if backstage?(item)
      update_conjured_quality(item) if conjured?(item)
      update_normal_quality(item) if normal?(item)
    end
  end

  def update_sell_in(item)
    item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def update_brie_quality(item)
    item.quality += 1
  end

  def update_normal_quality(item)
    item.quality -= 1 if item.quality > 0
    item.quality -= 1 if item.quality > 0 && item.sell_in < 0
  end

  def update_backstage_quality(item)
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality -= item.quality if item.sell_in < 0
  end

  def update_conjured_quality(item)
    item.quality -= 2
  end

  def normal?(item)
    item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert' && item.name != 'Sulfuras, Hand of Ragnaros' && item.name != 'Conjured Mana Cake'
  end

  def brie?(item)
    item.name == 'Aged Brie' && item.quality < 50
  end

  def backstage?(item)
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def conjured?(item)
    item.name == 'Conjured Mana Cake'
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
