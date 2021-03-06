class ProfilesController < ApplicationController
  #redirect to create a progile_if user does not have a profile
  before_action :set_profile, only: %i[ show edit update destroy ]

  def signedinuserprofile
    profile = Profile.find_by_user_id(current_user.id)
    ##Redirect user to create a new profile if profile does not exixt
    if profile.nil?
      redirect_to "/profiles/new"
    else
      @profile = Profile.find_by_user_id(current_user.id) ##Added in
      redirect_to root_path
    end
  end
  # GET /profiles or /profiles.json
  def index
    #@profiles = Profile.all #ORG
    @profiles = Profile.all #Show all Profile
    #@user = current_user
    ##Added
    # redirect_to root_path
    #     flash[:error] = "Restricted Area"

  end

  # GET /profiles/1 or /profiles/1.json
  def show
    #if the user has not created an account yet redirect to Sign up page
    #@profile = Profile.find_by_user_id(current_user.id)
    if @profile.nil?
      redirect_to "/profiles/new"
    else
      @profile = Profile.find_by_user_id(current_user.id)
      #redirect_to "/profiles/#{@profile.id}"
      #redirect_to "/profiles/show"

      #@current = current_user
      #Check Admin Status decorator
      #@user_decorator = helpers.decorate(current_user)
    end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    puts current_user.id
    respond_to do |format|
      format.html  #new.html.erb
      format.json { render json: @profile }
    end
    #end
  end

  # GET /profiles/1/edit
  def edit
    #@profile.user = current_user
    @profile = Profile.find(params[:id])
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        #redirect_to profiles_url(@user)
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    #@user = current_user
    #@users.Profile.clear
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def destroy
  #   @profile = Profile.find(params[:id])
  #   if @profile.present?
  #     @profile.user.clear
  #     @profile.destroy
  #   end
  #   redirect_to root_url
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id]) ### Testing
      #@profile = Profile.find(params[:user_id]) ### Testing
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      #params.require(:profile).permit(:first_name, :last_name, :address, :medical_license, :pps_num, :user_id)
      params.require(:profile).permit(:firstname, :lastname, :address, :medical_license, :pps_num)
    end
end
