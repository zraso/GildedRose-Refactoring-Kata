require 'gilded_rose'

describe GildedRose do

  before :each do
    @items=[Item.new("foo", 0, 0), Item.new("foo", 0, 6), Item.new("Aged Brie", 10, 6), Item.new("Aged Brie", 10, 50)]
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
  end

end
