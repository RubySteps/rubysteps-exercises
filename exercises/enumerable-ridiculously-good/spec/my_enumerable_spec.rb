require_relative '../lib/my_enumerable'

describe MyEnumerable do
  # This class wraps an enumerable object and delegates each.
  # We do this so MyCollection only has the behavior provided
  # by `MyEnumerable`, nothing else
  class MyCollection
    include MyEnumerable

    def initialize(collection)
      @collection = collection
    end

    def each(&block)
      @collection.each(&block)
    end
  end

  describe '#select' do
    it 'returns items that match the block' do
      ruby_collection = [1, 2, 3, 4, 5]
      my_collection = MyCollection.new ruby_collection

      ruby_result = ruby_collection.select(&:odd?)
      my_result = my_collection.select(&:odd?)

      expect(my_result).to eq(ruby_result)
    end
  end

  describe '#reject' do
    it 'returns items that do not match the block' do
      ruby_collection = [1, 2, 3, 4, 5]
      my_collection = MyCollection.new ruby_collection

      ruby_result = ruby_collection.reject(&:odd?)
      my_result = my_collection.reject(&:odd?)

      expect(my_result).to eq(ruby_result)
    end
  end

  describe '#collect' do
    it 'evaluates a block for each item and returns the result' do
      ruby_collection = [1, 2, 3, 4, 5]
      my_collection = MyCollection.new ruby_collection

      ruby_result = ruby_collection.collect(&:odd?)
      my_result = my_collection.collect(&:odd?)

      expect(my_result).to eq(ruby_result)
    end
  end

  describe '#partition' do
    it 'evaluates a block for each item and divides the collection in to two' do
      ruby_collection = [1, 2, 3, 4, 5]
      my_collection = MyCollection.new ruby_collection

      ruby_result = ruby_collection.partition(&:odd?)
      my_result = my_collection.partition(&:odd?)

      expect(my_result).to eq(ruby_result)
    end
  end

  describe '#any?' do
    it 'returns true if at least one item block evaluates to truthy' do
      ruby_collection = [1, 2, 3, 4, 5]
      my_collection = MyCollection.new ruby_collection

      ruby_result = ruby_collection.any? {|item| item > 4 }
      my_result = my_collection.any? {|item| item > 4 }

      expect(my_result).to eq(ruby_result)
    end

    it 'returns false if no item blocks evaluate to truthy' do
      ruby_collection = [1, 2, 3, 4, 5]
      my_collection = MyCollection.new ruby_collection

      ruby_result = ruby_collection.any? {|item| item > 5 }
      my_result = my_collection.any? {|item| item > 5 }

      expect(my_result).to eq(ruby_result)
    end
  end

  # Keep going... write your own examples for built-in Ruby behavior

  describe '#all?'

  describe '#group_by'

  # and any other Enumerable methods you like...
end
