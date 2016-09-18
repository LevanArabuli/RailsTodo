class AccountsController < ApplicationController

  def login
  end

  def login_post
    email = params[:email]
    pwd = params[:password]

    user = User.find_by_email(email)

    if !user.nil? && user.authenticate(pwd)
      session[:user] = user
      redirect_to '/'
    else
      @error = 'Email or password is incorrect'
      render :login
    end
  end

  def register
    @user = User.new
  end

  def register_post
    @user = User.new(user_params)

    if User.exists?(email: @user.email)
      @user.errors.add(:email, 'Email is already taken')
      return render :register
    end

    if params[:user][:password] != params[:user][:confirm_password]
      @user.errors.add(:confirm_password, ' does not match password field')
      return render :register
    end

    @user.password = params[:user][:password]
    @user.email_confirmed = false

    if @user.save
      redirect_to action: 'login'
    else
      render :register
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birth_date)
  end
end
