class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      update_sell_in(item)

      update_brie_quality(item)

      if normal?(item)

        if item.quality > 0 && item.sell_in < 0
          item.quality -= 2
        elsif item.quality > 0
          item.quality -= 1
        end
      end

      if backstage?(item)

        item.quality += 1
        item.quality += 1 if item.sell_in < 11
        item.quality += 1 if item.sell_in < 6
        item.quality -= item.quality if item.sell_in < 0
            
        # if item.sell_in < 11
        #   item.quality += 1
        # end

        # if item.sell_in < 6
        #   item.quality += 1
        # end

        # if item.sell_in < 0
        #   item.quality -= item.quality
        # end
            
      end
    end
  end

  def update_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end

  ##The item.quality < 50 bit is hacky. We need a method that checks if quality is under 50 and only updates if so
  def update_brie_quality(item)
    item.quality += 1 if (item.name == "Aged Brie" && item.quality < 50)
  end

  def normal?(item)
    item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"
  end

  def backstage?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end