class RatesController < ApplicationController
  def create
    #  binding.pry
     rate = current_user.rates.create(score: params[:rate][:score], shop_id: params[:rate][:shop_id])
    #  binding.pry
     redirect_to shops_url, notice: "#{rate.shop.user.name}さんの投稿を評価しました"
  end
end
