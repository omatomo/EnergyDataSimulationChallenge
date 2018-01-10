class HousesController < ApplicationController

	def index
   @houses = House.all
  end


  def show
  	@house = House.find(params[:id])
  end


  def new
  	@house = House.new
  end


  def edit
  	@house = House.find(params[:id])
  end


  def create
    @house = House.new(house_params)

    if @house.save
    	redirect_to root_url
    else
    	render 'new'
    end
  end


  def update
  	@house = House.find(params[:id])

  	if @house.update(house_params)
      flash[:success] = "編集に成功しました。"
      redirect_to root_url
  	else
  	 render 'edit'
    end
  end


  def destroy
  	House.find(params[:id]).destroy
  	redirect_to root_url
  end


  def import_csv_new
  end


  def import_csv
  	if House.import_csv(params[:csv_file])
  		redirect_to root_url, notice: 'csvの読み込みに成功しました。'
  	else
  		redirect_to root_url, notice: 'csvの読み込みに失敗しました。'
  	end
  end


  private

  def house_params
  	params.require(:house).permit(:firstname, :lastname, :city, :num_of_people, :has_child)
  end
end
