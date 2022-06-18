module Contexts
  module Items
    class Repository
      attr_reader :adapter

      def initialize(adapter: Item)
        @adapter = adapter
      end

      def create(name:, description:, price:, quantity:, status:)
        @adapter.create(name: name, description: description, price: price, quantity: quantity, status: status)
      end

      def update(id:, name:, description:, price:, quantity:, status:)
        @adapter.find(id).update(name: name, description: description, price: price, quantity: quantity, status: status)
      end

      def delete(id:)
        @adapter.destroy(id)
      end
    end
  end
end
