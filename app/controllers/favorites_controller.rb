class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(shop_id: params[:shop_id])
    @shop = params[:shop_id]
    redirect_to shop_url(@shop), notice: "#{favorite.shop.user.name}さんの記事をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to shops_url, notice: "#{favorite.shop.user.name}さんの記事をお気に入り解除しました"
  end

  def index
    @favorite_shops = current_user.favorite_shops
  end
end