class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
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
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @category = Category.find(@item.category_id)
    @condition = Condition.find(@item.condition_id)
    @fee = Fee.find(@item.fee_id)
    @area = Area.find(@item.area_id)
    @day = Day.find(@item.day_id)
  end  

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :condition_id, :fee_id, :area_id, :day_id, :price, :user_id, :image).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end
end
