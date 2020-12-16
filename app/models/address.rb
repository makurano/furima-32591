class Address < ApplicationRecord
  belongs_to :sold_item
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :prefecture


end
