# frozen_string_literal: true

require 'items_checker'

class GildedRose

  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      categorised_item = ItemsChecker.new(item).generate_type
      categorised_item.update_sell_in
      categorised_item.update_quality if item.quality < MAX_QUALITY
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
