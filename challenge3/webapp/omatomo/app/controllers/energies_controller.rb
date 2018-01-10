class EnergiesController < ApplicationController

	def index
		@energies = Energy.all
	end


	def show
		@energy = Energy.find(params[:id])
	end


	def new
		@energy = Energy.new
	end


	def edit
		@energy = Energy.find(params[:id])
	end


	def create
		 @energy = Energy.new(energy_params)
	end


	def update
	end


	def destroy
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

	def energy_params
	end
end
