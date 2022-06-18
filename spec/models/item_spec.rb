require "rails_helper"
require "faker"

RSpec.describe Item, type: :model do
  context "when passes sucessful" do
    it "parrams ok" do
      item = create(:item)
      expect(item).to be_valid
    end
  end

  context "when does return failure" do
    it "if price is not integer" do
      expect {
        create(:item,
          name: Faker::Name.name,
          description: "XD",
          price: "price",
          quantity: 100,
          status: true)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "if quantity is not integer" do
      expect {
        create(:item,
          name: Faker::Name.name,
          description: "XD",
          price: 100,
          quantity: "quantity",
          status: true)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
