# frozen_string_literal: true

class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    @warehouse.name = warehouse_params[:name]
    inventory_items = InventoryItem.where(id: warehouse_params[:inventory_item_ids])
    @warehouse.inventory_items = inventory_items
    @warehouse.save

    redirect_to action: 'index'
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    warehouse = Warehouse.new
    warehouse.name = warehouse_params[:name]
    inventory_items = InventoryItem.where(id: warehouse_params[:inventory_item_ids])
    warehouse.inventory_items = inventory_items
    warehouse.save

    redirect_to action: 'index'
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, inventory_item_ids: [])
  end
end
