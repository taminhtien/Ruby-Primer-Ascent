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


