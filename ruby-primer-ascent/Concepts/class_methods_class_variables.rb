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