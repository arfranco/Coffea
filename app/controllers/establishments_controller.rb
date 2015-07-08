class EstablishmentsController < ApplicationController
  before_action :authenticate_with_token!

  def create
    @establishment = Establishment.new(name: params[:name],
                                       street_address: params[:street_address],
                                       city: params[:city],
                                       state: params[:state],
                                       zip_code: params[:zip_code])
    if @establishment.save
      # render json "register.json.jbuilder", status: :created
      render json: { establishment: @establishment.as_json(only: [:name, 
                                                                  :street_address, 
                                                                  :city, 
                                                                  :state,
                                                                  :zip_code]) },
        status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def index
    @establishments = Establishment.all
    render 'index.json.jbuilder', status: :ok
  end

  def show 
    @establishment = Establishment.find_by(id: params[:id])
    if @establishment
    # render json "register.json.jbuilder", status: :created
    render json: { establishment: @establishment.as_json(only: [:name, :street_address,
                                                                :city, :state,
                                                                :zip_code, :coffee_quality,
                                                                :ambiance, :price,
                                                                :wifi?]) },
      status: :ok
    end
  end

  def update

  end

end