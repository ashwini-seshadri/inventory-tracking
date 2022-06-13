# frozen_string_literal: true

class CreateInventoryItemWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :inventory_items, :warehouses
  end
end
