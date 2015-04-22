class Item
  def inspect
    "Result of inspect"
  end
end

puts Item.new
puts Item.new.to_s
p Item.new

# puts generally prints the result of applying to_s on an object while p prints the result of inspecting the object.

class Item2
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
end

item = Item2.new("a",1)

puts item
p item

# puts prints the class name of the object along with a number displayed as hex.
# The number is relative to the position of the object in memory, but we seldom find any use for it.

# p on the other hand prints the class name and all the instance variables of the object.
# This can be very useful while debugging.

# But there will be occasions when you'd want to customize what these methods display.
# This is easily done by overriding the to_s method.

class Item3
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end

  def to_s
    "to_s for puts"
  end

  def inspect
    "Inspect for p"
  end
end

item = Item3.new("a",1)

puts item
p item