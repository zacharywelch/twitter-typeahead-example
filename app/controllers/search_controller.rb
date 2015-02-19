class SearchController < ApplicationController
  respond_to :json, :html
  def index
    @users = User.where('name LIKE ?', "%#{params[:q]}%")
    @products = Product.where('name LIKE ?', "%#{params[:q]}%")
    respond_with users: @users, products: @products
  end
end
