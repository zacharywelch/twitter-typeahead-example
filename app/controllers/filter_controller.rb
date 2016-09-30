class FilterController < ApplicationController

  def index
    @characters = Character.all
  end
end
