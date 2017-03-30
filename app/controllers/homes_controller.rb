class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :require_is_admin, only: [:new, :edit, :update, :destroy, :create]


  def index
    @homes = Home.all

    if params[:dist_ids].present?
      #flash[:notice] = "District #{params[:dist_ids].split(",")}"
      @homes = @homes.where( :district_id => params[:dist_ids] )
    end

    if params[:ed_ids].present?
      #flash[:notice] = "District #{params[:dist_ids].split(",")}"
      @homes = @homes.includes(:eventdateships).where( :eventdateships => { :eventdate_id => params[:ed_ids] } )
    end

    @homes = @homes.paginate(:page => params[:page], :per_page => 5)
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
    params.require(:home).permit(:name, :address, :district_id, :eventdate_ids => [])
  end

end
