class HomesController < ApplicationController


  def index
    @homes = Home.all
  end

  def show
    @home = Home.find(params[:id])
  end

  def new
    @home = Home.new
  end
  def create
    @home = Home.new(home_params)

    if @home.save
      redirect_to homes_path
    else
      render :new
    end
  end

  def edit
    @home = Home.find(params[:id])
  end
  def update
   @home = Home.find(params[:id])

   if @home.update(home_params)
     redirect_to homes_path, notice: "Update Success"
   else
     render :edit
   end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    flash[:alert] = "删除茶家 #{@home.name}"
    redirect_to homes_path
  end

  private

  def home_params
    params.require(:home).permit(:name, :address, :district_id)
  end

end
