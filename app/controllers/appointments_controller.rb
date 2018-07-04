class AppointmentsController < ApplicationController
	def new
	end

	def create
  		render plain: params[:appointment].inspect
	end
end
