class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture, :city, :number, :building, :phone, :token, :user_id, :item_id

  validates :token, presence: true

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture, numericality: { other_than: 0, message: 'Select'}
    validates :city, :number
    validates :phone, format: {with: /\A[0-9]+\z/, message: "Half size number"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture: prefecture, city: city, number: number, building: building, phone: phone, purchase_id: purchase.id)
  end  
end