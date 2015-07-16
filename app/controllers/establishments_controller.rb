class EstablishmentsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show, :update]

  def create
    @establishment = Establishment.new(name: params[:name],
                                       street_address: params[:street_address],
                                       city: params[:city],
                                       state: params[:state],
                                       zip_code: params[:zip_code],
                                       coffee_quality: params[:coffee_quality],
                                       wifi: params[:wifi],
                                       price: params[:price],
                                       ambiance: params[:ambiance])
    if @establishment.save
      # render json "register.json.jbuilder", status: :created
      render json: { establishment: @establishment.as_json(only: [:id,
                                                                  :name, 
                                                                  :street_address, 
                                                                  :city, 
                                                                  :state,
                                                                  :zip_code,
                                                                  :coffee_quality,
                                                                  :wifi,
                                                                  :price,
                                                                  :ambiance]) },
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
    @establishment = Establishment.find_by(id: params[:id])
    attributes = {
      name: params[:name],
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      coffee_quality: params[:coffee_quality],
      ambiance: params[:ambiance],
      price: params[:price],
      wifi?: params[:wifi?]
    }
    if @review.update(attributes)
      render json: { user: @review.as_json(only: [:id, :content, :flagged, :image_url]) }, status: :ok
    else
      render json: { errors: "There was an issue with the attributes you tried to update." }, 
                    status: :unproccessable_entity
    end
  end

  def search
    @establishments = Establishment.where(nil) # creates an anonymous scope
    @establishments = @establishments.wifi(params[:wifi]) if params[:wifi].present?
    @establishments = @establishments.ambiance(params[:ambiance]) if params[:ambiance].present?
    @establishments = @establishments.price(params[:price]) if params[:price].present?
    @establishments = @establishments.coffee_quality(params[:coffee_quality]) if params[:coffee_quality].present?
    render json: @establishments, status: :ok
  end
  

end