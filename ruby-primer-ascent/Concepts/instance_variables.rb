# Every instance of a class has a different set of instance variables

class Item
  def initialize(item_name, quantity)
    @item_name = item_name
    @quantity = quantity
  end

  def show
    puts @item_name
    puts @quantity
  end
end

Item.new("tv",1).show
Item.new("fridge",1).show

# What is the difference between local and instance variables?

class Item
  def initialize(item_name, quantity)
    @item_name = item_name
    @quantity = quantity
    supplier = "Acme corp" # ==> local variable
  end

  def show
    puts @item_name
    puts @quantity
    puts supplier # ==> error
  end
end

Item.new("tv",1).show # ==> raise an error

# A local variable is available only inside the method it is defined.
# It is not shared across the entire object.
# The 'scope' of a local variable is bound to the method where it is defined.

# The instance variable is bound to the specific instance of the class.
# By binding itself to the entire object, an instance variable makes itself available to every method of the object.


# Getter and Setter methods
# 'getter' methods whose sole purpose is to return the value of a particular instance variable.

class Item
  def initialize(item_name, quantity)
    @item_name = item_name
    @quantity = quantity
  end

  def item_name # ==> getter
    @item_name
  end
end

item = Item.new("tv",1)
puts item.item_name

class Item
  def initialize(description, color)
    @description = description
    @color = color
  end

  def description # => which returns a string that has both the description and color of the object.
    "#{@color} #{@description}"
  end
end

# Setter

class Item
  def initialize(item_name, quantity)
    @item_name = item_name
    @quantity = quantity
  end

  def quantity=(new_quantity) # setter
    @quantity = new_quantity
  end

  def quantity
    @quantity
  end
end

item = Item.new("a",1)
item.quantity = 3
p item.quantity

# Ruby provides a couple of methods to make life easy when declaring getters and setters for your object.
# Let us start with an example of the attr_reader method:

class Item2
  attr_reader :item_name # => getter

  def initialize(item_name)
    @item_name = item_name
  end
end

item = Item2.new("agragarok")
p item.item_name

# attr_writer
class Item
  attr_writer :description, :color # ==> setter
  def initialize(description, color)
    @description = description
    @color = color
  end
end

# attr_accessor, which will define both the getter and setter
# attr_reader :description will define def description; @description; end
# attr_writer :description gives you def description=(new_description); @description = new_description; end
# attr_accessor :description is equivalent to attr_reader :description; attr_writer :description

