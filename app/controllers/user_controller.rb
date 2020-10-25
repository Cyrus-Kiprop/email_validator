class UserController < ApplicationController
  include UserHelper
  def index
    # create  a new instance of the user
    @user = User.new

    # fetch all the user in the DB
    @users = User.all
  end

  def create
    response = validator(user_params[:first_name], user_params[:last_name], user_params[:url])

    # Handle any error from the the request
    if check_error(response)
      flash[alert] = response['info']
      redirect_to :user_index
      return
    end

    # handle case where no valid email was found
    unless response
      flash[alert] = 'Please choose another url'
      redirect_to :user_index, notice: 'Error while generating a valid email.'
      return
    end

    # update the user email with a valid email address
    @user = User.new(user_params)
    @user.email = response

    respond_to do |format|
      if @user.save
        format.html { redirect_to :user_index, notice: 'User was successfully created.' }
      else
        flash[notice] = @user.errors.full_messages[0]
        format.html { redirect_to :user_index }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :url)
  end
end
