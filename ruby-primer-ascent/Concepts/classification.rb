=begin
  Classes act as templates for the creation of objects, specifying their state and behaviour
  An object created by a class is called an instance of that class
  A class is itself an object, and an instance of the class Class
=end

puts "A String".is_a?(String) # true
puts 1.is_a?(String)          # false

def know_it_all(object)
  object.class
end
puts 1.0.is_a?(Float)
puts 1.0.is_a?(Numeric)
puts 1.0.class # Float
puts 1.0.class.superclass # Numeric
puts Float.superclass # Numeric

# The Class#superclass method tells you which class any given class was inherited from.
# Note that it's an instance method on Class and not on Object.
# Object -> class
# Class -> superclass

puts Float.superclass    # Numeric
puts Numeric.superclass  # Object
puts Object.superclass   # BasicObject, empty class

# How many methods are uniquely 1.0s and how many are inherited by it from its ancestors (tổ tiên).
puts BasicObject.instance_methods.count
puts BasicObject.methods.sort
puts Float.instance_methods.count
puts Object.instance_methods.count
puts (Float.instance_methods - Object.instance_methods).count


puts (
     Float.instance_methods -
         Object.instance_methods -
         Numeric.instance_methods
     ).count


def is_ancestor?(klass, subclass)
  while subclass != klass && subclass.superclass != nil do
    subclass = subclass.superclass
  end
  subclass == klass
end

def is_ancestor2?(klass, subclass)
  while subclass != klass && subclass.superclass != BasicObject do
    subclass = subclass.superclass
  end
  subclass == klass
end

p is_ancestor?(Numeric, String)
p Numeric.superclass