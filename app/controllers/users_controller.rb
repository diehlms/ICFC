class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    # GET /users
    # GET /users.json
    def index
      @users = User.all.paginate(page: params[:page]).reorder('lastname ASC')
    end
  
    # GET /users/1
    # GET /users/1.json
    def show
      # respond_to do |format|
      #   if @user
      #     format.json { render json: user }
      #   else
      #     format.json { render json: @user.errors }
      #   end
      # end
    end
  
    # GET /users/new
    def new
      @user = User.new
    end
  
    # GET /users/1/edit
    def edit
    end
  
    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          UserMailer.registration_confirmation(@user).deliver
          flash[:notice] = "A registration link was just emailed to you. Please follow the link in your inbox to continue. If not in your main inbox, please check your spam folder."
          format.html { redirect_to root_url }
        else
          flash.now[:error] = "Something went wrong! Try again."
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def confirm_email
      user = User.find_by_confirm_token(params[:id])
      if user
        user.email_activate
        flash[:success] = "Welcome to ICFC! Your email has been confirmed. Please sign in to continue"
        redirect_to login_url
      else
        flash[:error] = "Sorry. User information does not exist."
        redirect_to root_url
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:username, :firstname, :lastname, :email, :phone_number, :password, :password_confirmation, :confirm_token, :password_reset_token)
      end
  end