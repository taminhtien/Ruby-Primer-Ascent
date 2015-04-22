# Arrays, string and Hashes are standard Ruby data structures the equality operator ==
puts [1,2] == [1,2]
puts [1,2] == [1,3]

puts "a" == "xyz"

class Item
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
end

p Item.new("abcd",1)  == Item.new("abcd",1)

class Item2
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
  def to_s
    "Item (#{@item_name}, #{@qty})"
  end
  def ==(other_item)
    puts "Method == called on #{self} with parameter #{other_item}"
    false
  end
end

# this line should invoke the `==` method defined in the Item class.
puts Item2.new("abcd",1) == Item2.new("abcd", 1)

class Item3
  attr_reader :item_name, :qty

  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
  def to_s
    "Item (#{@item_name}, #{@qty})"
  end
  def ==(other_item)
    if self.item_name == other_item.item_name && self.qty == other_item.qty
    return true
    else
      return false
    end
  end
end

p Item3.new("abcd",1)  == Item3.new("abcd",1)
p Item3.new("abcd",2)  == Item3.new("abcd",1)

# Object equality, the eql? method and hash codes

class Item4
  attr_reader :item_name, :qty
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
  def to_s
    "Item (#{@item_name}, #{@qty})"
  end
  def ==(other_item)
    self.item_name == other_item.item_name && self.qty == other_item.qty
  end
end

items = [Item4.new("abcd", 1), Item4.new("abcd", 1), Item4.new("abcd", 1)]
p items.uniq

p 1.hash
p "Hello".hash
p "Hello!".hash
p [1,2,3].hash
p({:x => 1, :y => 2}.hash)

class Item5
  def initialize(name)
    @name = name
  end
end

p Item5.new("ruby").hash

# Use hash for compare

class Item6
  attr_reader :item_name, :qty

  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end

  def to_s
    "Item (#{@item_name}, #{@qty})"
  end

  def hash
    self.item_name.hash ^ self.qty.hash # => sort nunber
  end

  def eql?(other_item)
    puts "#eql? invoked"
    @item_name == other_item.item_name && @qty == other_item.qty
  end

end

p Item6.new("abcd", 1).hash

items = [Item6.new("abcd", 1), Item6.new("abcd", 1), Item6.new("abcd", 1)]
p items.uniq

# Wrapping up Object Equality in Ruby

class Item7
  attr_reader :item_name, :quantity, :supplier_name, :price
  def initialize(item_name, quantity, supplier_name, price)
    @item_name = item_name
    @quantity = quantity
    @supplier_name = supplier_name
    @price = price
  end

  def ==(other_item)
    @item_name == other_item.item_name && @quantity = other_item.quantity && @supplier_name == other_item.supplier_name && @price == other_item.price
  end

  def eql?(other_item)
    self == other_item
  end
  def hash
    @item_name.hash ^ @quantity.hash ^ @supplier_name.hash ^ @price.hash
  end
end
