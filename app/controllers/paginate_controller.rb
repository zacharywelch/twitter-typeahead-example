class PaginateController < ApplicationController

  def index
    @characters = Character.page(params[:page])
  end
end
