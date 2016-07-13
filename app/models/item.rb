class Item < ActiveRecord::Base
  has_many :customer_item, dependent: :destroy
  has_many :customers, through: :customer_item, dependent: :destroy
end
