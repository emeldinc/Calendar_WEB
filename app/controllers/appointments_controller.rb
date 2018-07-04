class AppointmentsController < ApplicationController
	def new
	end

	def show
    	@appointment = Appointment.find(params[:id])
  	end
	
	def create
	  @appointment = Appointment.new(appointment_params)
	  @appointment.save
	  redirect_to @appointment
	end
	 
	private
	  def appointment_params
	    params.require(:appointment).permit(:title, :comment, :date, :start_time, :end_time)
	  end
end
