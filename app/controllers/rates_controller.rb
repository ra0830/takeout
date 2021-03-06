class RatesController < ApplicationController
  def create
    rate = current_user.rates.create(score: params[:rate][:score], shop_id: params[:rate][:shop_id])
    @shop = params[:rate][:shop_id]
     redirect_to shop_path(@shop), notice: "#{rate.shop.user.name}さんの投稿を評価しました"
  end
end
