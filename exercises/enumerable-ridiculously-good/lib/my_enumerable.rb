# MyEnumerable will contain all of the enumerable behavior.
# Classes get the behavior automatically just by including
# it and implementing #each
#
# I implemented #select to show you how it works
module MyEnumerable
  def select(&block)
    result = []
    each {|item| result << item if block.call(item) }
    result
  end
end
