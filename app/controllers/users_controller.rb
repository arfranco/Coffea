class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @action = users_path
    render :new
  end

  def create
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.create(email: params[:email], password: passhash)
    flash[:notice] = "User successfully created"
    redirect_to :root
  end

  def index
    @users = User.all
  end

end