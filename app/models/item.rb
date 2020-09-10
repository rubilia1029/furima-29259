class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :explain
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select'}
    validates :fee_id, numericality: { other_than: 1, message: 'Select'}
    validates :day_id, numericality: { other_than: 1, message: 'Select'}
    validates :area_id, numericality: { other_than: 0, message: 'Select'}
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number.'}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range'}
end
