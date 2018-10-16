class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  PER = 10

  def index
    @shops = Shop.page(params[:page]).per(PER)
  end
  
  def new
    if params[:back]
      @shop = Shop.new(shop_params)
    else
      @shop = Shop.new
    end
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path, notice: 'お店を登録しました！'
    else
      render 'new'
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

   def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shops_path, notice: 'お店の情報を編集しました！'
    else
      render 'edit'
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path, notice:'お店の情報を削除しました'
  end

  def confirm
    @shop = Shop.new(shop_params)
    render :new if @shop.invalid?
  end

  private

  def shop_params
     params.require(:shop).permit(:shop_name, :impression)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
