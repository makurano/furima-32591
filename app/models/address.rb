class Address < ApplicationRecord
  belongs_to :sold_item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
