class UserController < ApplicationController
  include UserHelper
  def index
    @user = User.new
    @users = User.all
  end

  def create

    valid_email = validator(user_params['first_name'], user_params['last_name'], user_params['url'])

    p 'this is the valid email'

    p valid_email

    if !valid_email
      flash[alert] = 'Please choose another url'
      redirect_to :user_index, notice: 'Error  created.'
      return
    end



    user_params[:url] = valid_email

    @user = User.new(user_params)

  respond_to do |format|
       if @user.save
         format.html { redirect_to :user_index, notice: 'User was successfully created.' }
         format.json { render :show, status: :created, location: @user }
       else
         format.html { render :new }
         format.json { render json: @user.errors, status: :unprocessable_entity }
       end
     end
  end

  private
 # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :url)
  end
end
