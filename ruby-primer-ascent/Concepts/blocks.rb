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

# Yielding to blocks

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

# Blocks can be passed implicitly to methods without any parameters

def foo
  yield
end
foo { puts "sometimes shortcuts do get you there faster"  }

# Magic blocks

def foo
  puts yield
  puts method(:foo) # => the method method correctly returns the object that represents foo
  # uncomment the following line and see what happens!
  #puts method(:yield) # => Error because yield is not a method
end

foo { "I expect to be heard." }

# Is it a given
def foo
  yield
end

foo # => Error because no block given

# => block_given? method

def foo
  yield if block_given?
end # => No error


# Calling the method prettify_it without an implicitly passed block results in a LocalJumpError
# because yield is invoked without a block being present ✔
# Calling prettify_it { "Hello, world" } returns "The result of the block was: Hello, world" ✔
# Calling prettify_it { 1 + 1 } returns "The result of the block was: 2" ✔
def prettify_it
  "The result of the block was: #{yield}" # yield là một block code, nếu không kiểm tra có truyền block code vào không
                                          # thì sẽ gây ra lỗi LocalJumpError.
end

# Converting implicit blocks to explicit

# Converting implicit to explicit

def calculation(a, b, &block) # &block is an explicit (named) parameter
  block.call(a, b)
end

puts calculation(5, 5) { |a, b| a + b } # this is an implicit block
                                        # -- it is nameless and is not
                                        # passed as an explicit parameter.

# Explicit to implicit
def calculation(a, b)
  yield(a, b) # yield calls an implicit (unnamed) block
end

addition = lambda {|x, y| x + y}
puts calculation(5, 5, &addition) # like our last example, &addition is
                                  # an explicit (named) block
                                  # -- but `yield` can still call it!

# 1. The block should be the last parameter passed to a method.
# 2. Placing an ampersand (&) before the name of the last variable triggers the conversion.

# The Array#select method does exactly this but requires an implicit block.
# Try converting the explicit block into an implicit block and passing it on to Array#select.
def filter(array, block)
  return array.select(&block)
end

# The conversion of blocks from implicit to explicit and back again
Filter = lambda do |array, &block|
  array.select(&block)
end