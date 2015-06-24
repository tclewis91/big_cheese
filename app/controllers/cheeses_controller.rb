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

    respond_to do |format|
      if @cheese.save
        format.html { redirect_to @cheese, notice: 'Cheese was successfully created.' }
        format.json { render :show, status: :created, location: @cheese }
      else
        format.html { render :new }
        format.json { render json: @cheese.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cheese.update(cheese_params)
        format.html { redirect_to @cheese, notice: 'Cheese was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheese }
      else
        format.html { render :edit }
        format.json { render json: @cheese.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cheese.destroy
    respond_to do |format|
      format.html { redirect_to cheeses_url, notice: 'Cheese was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_cheese
    @cheese =  Cheese.find(params[:id])

    def cheese_params
      params.require(:cheese).permit(:name, :texture, :user_id)

end
