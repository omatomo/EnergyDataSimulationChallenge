class EnergiesController < ApplicationController
	before_action :set_energy, only: %i[show edit update destroy]

	def index
		@energies = Energy.all
	end


	def show
	end


	def new
		@energy = Energy.new
	end


	def edit
	end


	def create
		 @energy = Energy.new(energy_params)

		 if @energy.save
			 redirect_to energies_path
		 else
			 render 'new'
		 end
	end


	def update
		if @energy.update(energy_params)
      flash[:success] = "編集に成功しました。"
      redirect_to root_url
  	else
  	 render 'edit'
    end
	end


	def destroy
		@energy.destroy
		redirect_to energies_path
	end


  def import_csv_new
  end


  def import_csv
  	if Energy.import_csv(params[:csv_file])
  		redirect_to energies_path, notice: 'csvの読み込みに成功しました。'
  	else
  		redirect_to energies_path, notice: 'csvの読み込みに失敗しました。'
  	end
  end


	private

	def energy_params
		params.require(:energy).permit(:label, :house_id, :year, :month, :temperature, :daylight, :energy_production)
	end

	def set_energy
		@energy = Energy.find(params[:id])
	end
end
