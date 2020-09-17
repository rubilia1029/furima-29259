class PurchasesController < ApplicationController
  before_action :move_to_new
  before_action :move_to_top

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:token, :postcode, :prefecture, :city, :number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == item.user_id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
