class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  has_one_attached :image

  validates :image, :name, :explain, :price, presence: true
  validates :category_id, :condition_id, :fee_id, :day_id, numericality:{ other_than: 1, message: "Select"}
  validates :area_id, numericality:{ other_than: 0, message: "Select"}
  validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width number."}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
end
