class HomeController < ApplicationController
  def index
    @products = Product.take(30)
  end
end
