class Customer < ActiveRecord::Base
  has_many :customer_item, dependent: :destroy
  has_many :items, through: :customer_item, dependent: :destroy
end
