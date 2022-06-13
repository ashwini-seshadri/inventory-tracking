# frozen_string_literal: true

class DashboardController < ApplicationController
  def show
    @inventory_items = InventoryItem.all
    @warehouses = Warehouse.all
  end
end
