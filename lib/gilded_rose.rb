class GildedRose
  attr_reader :items
  
  def initialize item_attributes
    @items = item_attributes.map { |args| Item.new(*args) }
  end


  def update_backstage item
    if (item.sell_in < 11 && item.quality < 50)
      item.quality += 1
    end
           
    if (item.sell_in < 6 && item.quality < 50)
      item.quality += 1
    end
  end


  def update_quality

    @items.each do |item|

      if (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")
        if (item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros")
          item.quality -= 1
        end      
      else        
        if (item.quality < 50)
          item.quality += 1
          update_backstage(item) if (item.name == "Backstage passes to a TAFKAL80ETC concert")
        end
      end

      item.sell_in -= 1 unless (item.name == "Sulfuras, Hand of Ragnaros")


      if (item.sell_in < 0)
        
        if (item.name != "Aged Brie")
          if (item.name != "Backstage passes to a TAFKAL80ETC concert")
            if (item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros")
              item.quality -= 1
            end
          else
            item.quality = 0
          end
        else
          item.quality += 1 if (item.quality < 50)
        end
      
      end
    
    end
  
  end

end