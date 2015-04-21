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

# Inheriting Class
class MyArray < Array
end

class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
end

class Square < Rectangle
  def initialize(size)
    @length = size
    @breadth = size
  end
end

# Redefining methods
# Redefining a method involves simply replacing one method with another.
# The original method is simply... lost.

class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end

  def area
    @length * @breadth
  end
end

# Add an empty method named perimeter
# or area and watch tests break
class Rectangle
  def perimeter
  end

  def area
  end
end

class Fixnum
  def +(other)
    42
  end
end

# Super Powered

class Animal
  def move
    "I can move"
  end
end

class Bird < Animal
  def move
    super + " by flying"
  end
end

puts Animal.new.move
puts Bird.new.move

class Animal
  def move
    "I can move"
  end
end

class Bird < Animal
  def move
    super + " by flying"
  end
end

# Your code here
class Human < Animal
  def move
    super + " by walking"
  end
end

class Penguin < Bird
  def move
    "I can move by swimming"
  end
end