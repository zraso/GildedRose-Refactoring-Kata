class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      update_sell_in(item)

      update_brie_quality(item)

      ##Normal items
      #reduce quality of all normal items by 1 (if quality is more than 0)
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"

        if item.quality > 0 && item.sell_in < 0
          item.quality -= 2
        elsif item.quality > 0
          item.quality -= 1
        end
      end

      if item.name == "Backstage passes to a TAFKAL80ETC concert"

        item.quality += 1
            
        if item.sell_in < 11
          item.quality += 1
        end

        if item.sell_in < 6
          item.quality += 1
        end

        if item.sell_in < 0
          item.quality -= item.quality
        end
            
      end
    end
  end

  def update_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end

  def update_brie_quality(item)
    item.quality += 1 if (item.name == "Aged Brie" && item.quality < 50)
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