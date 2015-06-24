class CheesesController < ApplicationController
  def index
    @cheeses = Cheese.all
  end

  def show
  end

  def edit
  end

  def new
    @cheese = Cheese.new(cheese_params)
  end

  def create
    @cheese = Cheese.new(cheese_params)
end
