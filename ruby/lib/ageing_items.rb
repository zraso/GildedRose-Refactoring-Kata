class AgeingItems < NormalItems

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_quality
    item.quality += 1
  end

end