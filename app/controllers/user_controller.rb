class UserController < ApplicationController
  include UserHelper
  def index

    # create  a new instance of the user
    @user = User.new

    #fetch all the user in the DB
    @users = User.all
  end

  def create
    # return a valid email address or a false value if all the condition aren't satisfied
    valid_email = validator(user_params['first_name'], user_params['last_name'], user_params['url'])

    if !valid_email
      flash[alert] = 'Please choose another url'
      redirect_to :user_index, notice: 'Error while generating a valid email.'
      return
    end

    # update the user email with a valid email address
    user_params[:email] = valid_email

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
