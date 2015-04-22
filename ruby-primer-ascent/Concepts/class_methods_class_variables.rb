class Item
  def initialize(item_name) # ==> instance method
    @item_name = item_name
  end

  def show # ==> instance method
    puts "Instance method show invoked for '#{self}'"
  end

  def to_s
    "Item: #{@item_name}"
  end

end

Item.new("silence").show # ==> need new method to access method

# Instance method là method mà đòi hỏi phải khởi tạo object trước khi call,
# instance method có thể truy cập vào các instance variables
# Class method là method không đòi hỏi khởi tạo object trước khi call,
# class method không thể truy cập vào các instance variables
# Instance method tương đương với một method thông thường trong C++ như thế này: public void Method();
# Class method tương đương với một static method trong C++ như thế này: public static void Method();

class Item
  def self.show # ==> like static method
    puts "Class method show invoked"
  end
end

Item.show

# Another way

class Item

  class << self
    def show
      puts "Class method show invoked"
    end
  end

end
Item.show

# Class variables can be used to store data that belongs to a class, but not to its instances.
# Chỉ được sử dụng cho chính class đó, không cho các object instances from class

class Planet
  @@planets_count = 0

  def initialize(name)
    @name = name
    @@planets_count += 1
  end

  def self.planets_count
    @@planets_count
  end
end

Planet.new("earth"); Planet.new("uranus")

p Planet.planets_count

# Ex: Using class variables to store application configuration

class ApplicationConfiguration
  @@configuration = {}

  def self.set(property_name, value)
    @@configuration[property_name] = value
  end

  def self.get(property_name)
    @@configuration[property_name]
  end
end

ApplicationConfiguration.set("name", "Demo Application")
ApplicationConfiguration.set("version", "0.1")

p ApplicationConfiguration.get("version")
p ApplicationConfiguration.get("name")

# Class variables and inheritance

class ApplicationConfiguration
  @@configuration = {}

  def self.set(property, value)
    @@configuration[property] = value
  end

  def self.get(property)
    @@configuration[property]
  end
end

class ERPApplicationConfiguration < ApplicationConfiguration
end

class WebApplicationConfiguration < ApplicationConfiguration
end

ERPApplicationConfiguration.set("name", "ERP Application")
WebApplicationConfiguration.set("name", "Web Application")

p ERPApplicationConfiguration.get("name")
p WebApplicationConfiguration.get("name")

p ApplicationConfiguration.get("name") # ==> any changes in any class will affect to other class
# They all share the same copy of the class variable

# Class instance variable

class Foo
  @foo_count = 0 # ==> class instance variable != instance variable
  # @foo is initialized directly in the class body and is accessed only from class methods.

  def self.increment_counter
    @foo_count += 1
  end

  def self.current_count
    @foo_count
  end
end

class Bar < Foo
  @foo_count = 100
end

Foo.increment_counter
Bar.increment_counter
p Foo.current_count
p Bar.current_count

# Ex:

class ApplicationConfiguration
  @configuration = {} # ==> only one @

  def self.set(property, value)
    @configuration[property] = value
  end

  def self.get(property)
    @configuration[property]
  end
end

class ERPApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

class WebApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

ERPApplicationConfiguration.set("name", "ERP Application")
WebApplicationConfiguration.set("name", "Web Application")

p ERPApplicationConfiguration.get("name")
p WebApplicationConfiguration.get("name")

p ApplicationConfiguration.get("name")

# Class instance variables are a better alternative than class variables
# simply because the data is not shared across the inheritance chain.
# Another major difference between class variables and class instance variables
# are that class instance variables are available only in class methods.
# But class variables are available in both class methods and instance methods.

# Instance variables are available only for instances of a class.
# They look like @name. Class variables are available to both class methods and instance methods.
# They look like @@name It is almost always a bad idea to use a class variable to store state.
# There are only a very few valid use cases where class variables are the right choice.
# Prefer class instance variables over class variables when you do really need store data at a class level.
# Class instance variables use the same notation as that of an instance variable.
# But unlike instance variables, you declare them inside the class definition directly.

