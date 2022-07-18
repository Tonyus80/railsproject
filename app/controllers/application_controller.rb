class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_breadcrumbs
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :current_user, :logged_in?
  add_flash_types :info, :error, :warning


  def after_sign_in_path_for(resource)
    "/signedinuserprofile"
  end

  private
  #set Breadcrumbs remember last session (ID) (Not cookies but session and encripted)
  def set_breadcrumbs
    ### if
    logger.info "Create breadcrumbs for user session - logging pages the user has visited" ##Added in
    if session[:breadcrumbs]
      @breadcrumbs = session[:breadcrumbs]
      ## else create an Array
    else
      @breadcrumbs = Array.new
    end

    @breadcrumbs.push(request.url)
    if @breadcrumbs.count > 10
      @breadcrumbs.shift
    end
    session[:breadcrumbs] = @breadcrumbs
  end

  # before_action :statistics
  # def statistics
  #   return unless !current_user.admin?
  #   redirect_to root_path, alert: "You are not Authorized"
  #   # if current_user.admin?
  #   #   @users = User.all
  #   #   @patients = Patient.all
  #   #   @appointments = Appointment.all
  #   #
  #   # else
  #   #   redirect_to root_path, alert: "You are not Authorized"
  #   #
  #   # end
  # end



end
