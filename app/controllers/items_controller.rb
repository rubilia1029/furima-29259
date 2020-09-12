class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index, :show]
  before_action :move_to_top, only: :edit
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end  

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :condition_id, :fee_id, :area_id, :day_id, :price, :user_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    item = Item.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == item.user_id
  end
end
