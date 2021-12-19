class SearchController < ApplicationController
  def index
    @products2 = Product.all

    @search = params["search"]
    if @search.present?
        @name = @search["name"]
        @products2 = Product.where("name LIKE ?", "%#{@name}%")
    end
  end
  scope module: "product" do
    resources :search
  end
end
