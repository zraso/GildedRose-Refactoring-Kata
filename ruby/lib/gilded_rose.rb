# frozen_string_literal: true

require 'items_checker'

class GildedRose

  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      categorised_item = ItemsChecker.new(item).type
      if item.quality < 50
        categorised_item.update_sell_in
        categorised_item.update_quality
      end
    end
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
