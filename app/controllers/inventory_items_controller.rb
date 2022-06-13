# frozen_string_literal: true

class InventoryItemsController < ApplicationController
  def index
    @inventory_items = InventoryItem.all
  end

  def edit
    @inventory_item = InventoryItem.find(params[:id])
  end

  def update
    @inventory_item = InventoryItem.find(params[:id])
    @inventory_item.name = inventory_params[:name]
    warehouses = Warehouse.where(id: inventory_params[:warehouse_ids])
    @inventory_item.warehouses = warehouses
    @inventory_item.save

    redirect_to action: 'index'
  end

  def new
    @inventory_item = InventoryItem.new
  end

  def create
    inventory_item = InventoryItem.new
    inventory_item.name = inventory_params[:name]
    warehouses = Warehouse.where(id: inventory_params[:warehouse_ids])
    inventory_item.warehouses = warehouses
    inventory_item.save

    redirect_to action: 'index'
  end

  def destroy
    inventory_item = InventoryItem.find(params[:id])
    inventory_item.destroy
    redirect_to action: 'index'
  end

  private

  def inventory_params
    params.require(:inventory_item).permit(:name, warehouse_ids: [])
  end
end
