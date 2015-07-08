class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:delete, :show, :index, :update]
  
  def create
    password = password_encryption(params[:password])
    @user = User.new(email: params[:email],
                     password: password,
                     username: params[:username])
    if @user.save
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:email, 
                                                :access_token, 
                                                :username, 
                                                :id]) },
        status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def login
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.find_by(password: passhash,
                         username: params[:username])
    if @user
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:email,
                                                :access_token, 
                                                :username,
                                                :id]) },
        status: :ok
    else
      render json: { message: 'No matching username or password found.' },
        status: :not_found
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:email,
                                                :username,
                                                :id]) },
        status: :ok
    end
  end

  def index
    @users = User.all
    render 'index.json.jbuilder', status: :ok
  end

  def delete
    @user = User.find_by(username: params[:username])
    if current_user.access_token == @user.access_token
      @user.destroy
      render json: { message: 'User has been deleted'},
      status: :ok
    else
      render json: { message: 'Only the user can delete his/her own account.' },
        status: :unauthenticated
    end
    # redirect_to posts_path
  end

  def update
    @user = User.find_by(username: params[:username])
    attributes = {
      username: params[:username],
      password: pass_hash,
      email: params[:email]
    }
    if current_user.access_token == @user.access_token
      if @user.update(attributes)
        render json: { user: @user.as_json(only: [:id, :username, :email]) }, status: :ok
      else
        render json: { errors: "There was an issue with the attributes you tried to update." }, 
                      status: :unproccessable_entity
      end
    else
      render json: { message: "Only an authorized user can modify this account." }, status: :unauthorized
    end
  end

  private
  def password_encryption(password)
    if password.length > 8
      result = Digest::SHA1.hexdigest(password)
    else
      result = nil
    end
    result
  end

end