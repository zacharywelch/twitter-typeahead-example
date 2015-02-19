class QueryController < ApplicationController
  respond_to :json
  def index
    @groups = { 
      users: { items: [{ id: 1, score: 1, documenttype: "User" }, { id: 2, score: 3, documenttype: "Invoice" }, { id: 3, score: 7, documenttype: "Invoice" }], count: 15 },
      products: { items: [{ id: 1, score: 2, documenttype: "Product" }, { id: 2, score: 4, documenttype: "Account" }], count: 10 }
    }
  end
end
