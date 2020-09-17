class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  has_one_attached :image

  belongs_to :user
  has_one :purchase

  with_options presence: true do
    validates :image, :name, :explain
    validates :area_id, numericality: { other_than: 0, message: 'Select' }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number.'}
    with_options numericality: { other_than: 1, message: 'Select'} do
      validates :category_id, :condition_id, :fee_id, :day_id
    end
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range'}
end
