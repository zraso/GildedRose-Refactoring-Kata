require 'gilded_rose'

describe GildedRose do

  before :each do
    @items=[Item.new("foo", 0, 0), 
            Item.new("foo", 0, 6), 
            Item.new("Aged Brie", 10, 6), 
            Item.new("Aged Brie", 10, 50),
            Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
            Item.new(name="Backstage passes to a TAFKAL80ETC concert", 15, 20),
            Item.new(name="Backstage passes to a TAFKAL80ETC concert", 9, 20),
            Item.new(name="Backstage passes to a TAFKAL80ETC concert", 3, 20),
            Item.new(name="Backstage passes to a TAFKAL80ETC concert", 0, 0),
            Item.new(name="Conjured Mana Cake", 3, 6)]
    GildedRose.new(@items).update_quality
  end

  describe "#update_quality" do

    context 'when the sell by date has passed' do
      it "degrades quality twice as fast" do
        expect(@items[1].quality).to eq 4
      end
    end

    context "when sell by date has passed and quality is at zero" do
      it "does not change the name" do
        expect(@items[0].name).to eq "foo"
      end

      it "does not change quality of an item to negative" do
        expect(@items[0].quality).to eq 0
      end
    end

    context "when the item is Aged Brie" do
      it "increases in quality the older it gets" do
        expect(@items[2].quality).to eq 7
      end
    end

    it "never increases the quality above 50" do
      expect(@items[3].quality).to eq 50
    end

    context "when the item is Sulfuras" do
      it "never changes the sell in date" do
        expect(@items[4].sell_in).to eq 0
      end

      it "never decreases in quality" do
        expect(@items[4].quality).to eq 80
      end
    end

    context "when the item is Backstage passes" do
      it "increases in quality as its SellIn date approaches" do
        expect(@items[5].quality).to eq 21
      end

      it "increases in quality by 2 if SellIn is less than 10" do
        expect(@items[6].quality).to eq 22
      end

      it "increases in quality by 3 if SellIn is less than 5" do
        expect(@items[7].quality).to eq 23
      end

      it "decreases quality to zero after the concert" do
        expect(@items[8].quality).to eq 0
      end
    end

    # context "when the item is Conjured" do
    #   it "degrades in quality by 2" do
    #     expect(@items[9].quality).to eq 4
    #   end
    # end
  end

end
