# “A block is code that you can store in a variable like any other object and run on demand.”
puts 5 + 6

a = 5
b = 6
puts a + b

addition = lambda {|a, b| return a + b }
puts addition.call(5, 6)

# Block
empty_block = lambda { }
puts empty_block.object_id
puts empty_block.class # => Proc
puts empty_block.class.superclass

class Calculator
  def add(a, b)
    return a + b
  end
end

puts Calculator.new.add(5, 6)
class Calculator
  def add(a, b)
    return a + b
  end
end

addition_method = Calculator.new.method("add")
addition =  addition_method.to_proc

puts addition.call(5, 6)

Addition = lambda {|a, b| return a + b } # use this as your example!
Subtraction = lambda {|a, b| return a - b} # your code between the braces
Multiplication = lambda {|a, b| return a * b } # your code between the braces
Division = lambda {|a, b| return a / b} # your code between the braces

# Yield: passing exactly one block to a method
# Use regular block syntax

def calculation(a, b, operation)
  operation.call(a, b)
end

puts calculation(5, 6, lambda { |a, b| a + b }) # addition
puts calculation(5, 6, lambda { |a, b| a - b }) # subtraction

# Use yield

def calculation2(a, b)
  yield(a, b)
end

puts calculation2(5, 6) { |a, b| a + b } # addition
puts calculation2(5, 6) { |a, b| a - b } # subtraction

# Using yield is different from the regular approach
# - The block is now no longer a parameter to the method.
#   The block has been implicitly passed (truyền ngầm) to the method - note how it's outside the parentheses.
# - Yield makes executing the block feel like a method invocation within the method invocation rather than a block
#   that's being explicitly called using Proc#call.
# - You have no handle to the block object anymore - yield "magically" invokes it
#   without any object references being involved.




