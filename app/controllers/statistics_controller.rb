class StatisticsController < ApplicationController
  #before_action :authenticate_user! , only: [:index, :create] ##Added in
  #before_action :statistics
  before_action :admin_only_area

  def index
    # statistics
  end

  # def statistics
  #   admin_only_area
  # end

  def admin_only_area
    redirect_to root_path unless current_user.admin? #, alert: "You are not Authorized"
    end
    #  if current_user.admin?
    #    #@statistic = Statistic.all
    #     #@users = User.all
    # #   @patients = Patient.all
    # #   @appointments = Appointment.all
    # #
    # # else
    #    redirect_to root_path, alert: "You are not Authorized"
    # #
    #  end
  # end
    #redirect_to root_path
  #flash[:error] = "Restricted Area"

end
#end