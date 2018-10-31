class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :index]
  PER = 5

  def index
    @shops = Shop.page(params[:page]).per(PER)

    # 並び替え
    if params[:low].present? || params[:low] == 'true'
      @shops = @shops.order(:payment).page(params[:page]).per(PER)
    elsif params[:high].present? || params[:high] == 'true'
      @shops = @shops.order(:payment).reverse_order.page(params[:page]).per(PER)
    else  
      @shops = Shop.page(params[:page]).per(PER)
    end

    #タイトル検索
    if params[:search].present?
      @shops = @shops.search(params[:search], params[:page]).per(PER)
    end

    #カテゴリー検索
    if params[:shop].present? && params[:shop][:search_category].present?
      @shops = @shops.search_category(params[:shop][:search_category], params[:shop][:category], params[:page]).per(PER)
    end

  end
  
  def new
    if params[:back]
      @shop = Shop.new(shop_params)
    else
      @shop = Shop.new
    end
  end

  def create
    # binding.pry
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    
    if @shop.save
      redirect_to shops_path, notice: 'お店を登録しました！'
    else
      render 'new'
    end
  end

  def show
    # binding.pry        
    @shop = Shop.find(params[:id])
    @comments = @shop.comments
    @comment = @shop.comments.build
    @favorite = current_user.favorites.find_by(shop_id: @shop.id)
    @rate = current_user.rates.find_by(shop_id: @shop.id)
    # 評価の算出
    @sum = @shop.rates.sum(:score)
    @count = @shop.rates.count(:user_id)
    @average = (@sum/@count.to_f).round(2)
      # binding.pry
  end

  def edit
    if params[:test].present? || params[:test] == 'true'
      @shop = Shop.find(params[:id])
    else
      redirect_to shops_path
    end
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
    # binding.pry
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    render :new if @shop.invalid?
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :category, :station, :phone_number, :adress, :payment, :impression, :image, :image_cache)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
