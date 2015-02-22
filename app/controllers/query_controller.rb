class QueryController < ApplicationController
  respond_to :json
  def index
    @groups = { 
      users: { 
        items: [
          Account.new(id: 1, score: 1), 
          Account.new(id: 1, score: 1)
        ], 
        count: 15 
      },
      products: { 
        items: [
          Account.new(id: 1, score: 1), 
          Account.new(id: 1, score: 1)
        ], 
        count: 15 
      }
    }
  end
end
