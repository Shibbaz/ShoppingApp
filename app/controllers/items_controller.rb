class ItemsController < ApplicationController
  def index
    @items = Contexts::Items::Queries::ListAllItems.new.call
    render json: @items
  end

  def create
    @item = Contexts::Items::Repository.new.create(name: params[:name], description: params[:description], price: params[:price], quantity: params[:quantity], status: params[:status])
    render json: @item
  end

  def update
    @item = Contexts::Items::Repository.new.update(id: params[:id], name: params[:name], description: params[:description], price: params[:price], quantity: params[:quantity], status: params[:status])
    render json: @item
  end

  def delete
    @item = Contexts::Items::Repository.new.delete(id: params[:id])
    render json: @item
  end
end
