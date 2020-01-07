class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      #reduce quality of all normal items by 1 (if quality is more than 0)
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"

        if item.quality > 0
          item.quality -= 1
        end

      else
        #increase quality by 1 if Aged Brie or Backstage passes
        if item.quality < 50
          item.quality += 1
          #increase quality by a further 1 if in less than 10 days
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality += 1
              end
            end
            #increase quality by a further 1 if in less than 5 days
            if item.sell_in < 6
              if item.quality < 50
                item.quality += 1
              end
            end
          end
        end

      end

      #decreases sell in date by 1
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end


      if item.sell_in < 0

        if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"
            if item.quality > 0
                item.quality -= 1
            end
          else
            item.quality -= item.quality
        end
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

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end