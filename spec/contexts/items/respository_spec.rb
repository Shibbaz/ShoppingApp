require "rails_helper"
require "faker"

RSpec.describe Contexts::Items::Repository, type: :model do
  context "create method" do
    it "it success" do
      item = Contexts::Items::Repository.new.create(
        name: Faker::Book.title,
        description: "book",
        price: Faker::Number.number(digits: 2),
        quantity: Faker::Number.number(digits: 1),
        status: true
      )
      expect(item).to be_valid
    end
  end

  context "create method" do
    before do
      create(:item)
    end

    it "it success" do
      Contexts::Items::Repository.new.delete(id: Item.first.id)
      items = Item.all.reload
      expect(items.size).to eql(0)
    end
  end

  context "update method" do
    before do
      create_list(:item, 2)
    end

    it "it success" do
      item = Item.first
      updatedItem = Contexts::Items::Repository.new.update(
        id: item.id,
        name: Faker::Book.title,
        description: "book",
        price: Faker::Number.number(digits: 2),
        quantity: Faker::Number.number(digits: 1),
        status: true
      )
      expect(updatedItem).to_not eql(item)
    end
  end
end
