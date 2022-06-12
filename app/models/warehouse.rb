class Warehouse < ApplicationRecord
  has_many :inventory_items_warehouse
  has_many :inventory_items, through: :inventory_items_warehouse, dependent: :destroy
end
