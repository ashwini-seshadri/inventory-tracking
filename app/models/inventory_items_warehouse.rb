# frozen_string_literal: true

class InventoryItemsWarehouse < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :warehouse
end
