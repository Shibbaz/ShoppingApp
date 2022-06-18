require "rails_helper"

RSpec.describe "Items", type: :request do
  before do
    create_list :item, 2
  end

  describe "GET /index" do
    it "returns http success" do
      get "/items/index"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to_not eql(0)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post("/items/create", params: {name: Faker::Book.title, description: "book", price: Faker::Number.number(digits: 2), quantity: Faker::Number.number(digits: 1), status: true})
      expect(response).to have_http_status(:success)
      expect([JSON.parse(response.body)].size).to eql(1)
    end
  end

  describe "PUT /update" do
    before do
      create(:item)
    end

    it "returns http success" do
      first = Item.first
      put("/items/update", params: {id: first.id, name: Faker::Book.title, description: "book", price: Faker::Number.number(digits: 2), quantity: Faker::Number.number(digits: 1), status: true})
      expect(response).to have_http_status(:success)
      expect([JSON.parse(response.body)].size).to eql(1)
      expect(JSON.parse(response.body)).to_not eql(first)
    end
  end

  describe "Delete /delete" do
    it "returns http success" do
      first_id = Item.first.id
      delete("/items/delete", params: {id: first_id})
      expect(response).to have_http_status(:success)
      expect { Item.find(first_id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
