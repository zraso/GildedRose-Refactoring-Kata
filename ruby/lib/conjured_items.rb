require 'normal_items'

class ConjuredItems < NormalItems

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_quality
    item.quality -= 2
  end

end