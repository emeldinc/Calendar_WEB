module Meeting
  class Report < Grape::API

    resource :meeting_report do
      desc "List all Appointments"

      get do
        Appointment.all
      end
      desc "create a new appointment"
      params do
        requires :title, type: String
        requires :comment, type:String
        requires :date, type: String
        requires :start_time, type:String
        requires :end_time, type:String

      end
      post do
        Appointment.create!({
          title:params[:title],
          comment:params[:comment],
          date:params[:date],
          start_time:params[:start_time],
          end_time:params[:end_time]

        })
      end
      desc "delete an appointment"
      params do
        requires :id, type: String
      end
      delete ':id' do
        Appointment.find(params[:id]).destroy!
      end
      desc "update an appointment"
      params do
        requires :id, type: String
        requires :title, type: String
        requires :comment, type:String
        requires :start_time, type:String
        requires :end_time, type:String

      end
      put ':id' do
        Appointment.find(params[:id]).update({
          title:params[:title],
          comment:params[:comment],
          start_time:params[:start_time],
          end_time:params[:end_time]

        })
      end
    end

  end
end
