class UserController < ApplicationController
  def index
    # create  a new instance of the user
    @user = User.new

    # fetch all the user in the DB
    @users = User.all
  end

  def create

    if validate_email.success?
      @user = user(validate_email.email)
      if @user.save
        respond_to do |format|
          format.html { redirect_to :user_index, notice: 'User was successfully created.' }
        end
      else
        redirect_to :user_index, notice: @user.errors.full_messages[0]
      end
    else
      flash[:alert] = validate_email.errors['info']
      redirect_to :user_index
    end

  end




  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :url)
  end

  def validate_email
    EmailValidator.call(user_params[:first_name], user_params[:last_name], user_params[:url])
  end

  def user(email)
    @user = User.new(user_params)
    @user.email = email
    @user
  end
end
