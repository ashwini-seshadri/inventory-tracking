class InventoryItemsWarehouse < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :warehouse
end
