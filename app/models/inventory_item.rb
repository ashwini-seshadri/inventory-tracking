# frozen_string_literal: true

class InventoryItem < ApplicationRecord
  has_many :inventory_items_warehouses
  has_many :warehouses, through: :inventory_items_warehouses, dependent: :destroy
end
