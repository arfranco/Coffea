class ReviewsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :index, :show, :update, :delete, :available]

  def create
    flagged = blank(params[:flagged])
    @review = Review.new(content: params[:content],
                         user_id: params[:user_id],
                         establishment_id: params[:establishment_id],
                         flagged: flagged,
                         image_url: params[:image_url])
    if @review.save
      # render json "register.json.jbuilder", status: :created
      render json: { review: @review.as_json(only: [:id, :content, :user_id, 
                                                    :establishment_id, :flagged,
                                                    :image_url]) },
      status: :created
    else
      render json: { errors: @review.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def index
    @reviews = Review.all
    render 'index.json.jbuilder', status: :ok
  end

  def available
    @reviews = Review.where(flagged: [false])
    render 'index.json.jbuilder', status: :ok
  end 

  def show 
    @review = Review.find_by(id: params[:id])
    if @review
    # render json "register.json.jbuilder", status: :created
    render json: { review: @review.as_json(only: [:content, :user_id, 
                                                  :establishment_id, :flagged,
                                                  :image_url]) },
    status: :ok
    end
  end

  def update
    attributes = set_attributes(params)
    @review = Review.find_by(id: params[:id])
    @user = User.find_by(id: @review.user_id)
    if current_user.access_token == @user.access_token
      if @review.update(attributes)
        render json: { review: @review.as_json(only: [:id, :content, :user_id, 
                                                    :establishment_id, 
                                                    :flagged, :image_url]) }, 
        status: :ok
      else
        render json: { errors: "There was an issue with the attributes you tried to update." }, 
                      status: :unproccessable_entity
      end
    else
      render json: { message: "Only original user can modify this review." }, status: :unauthorized
    end
  end

  def delete
    @review = Review.find_by(id: params[:id])
    @user = User.find_by(id: @review.user_id)
    if current_user.access_token == @user.access_token
      @review.destroy
        render json: { message: "Review has been deleted." }, status: :no_content
    else
      render json: { message: "Only the original user is authorized to delete this review." }, status: :unauthorized
    end
  end

  def search
    search_text = params[:keyword]
    @reviews = Review.quick_search(search_text)
    if @reviews.present?
      render json: @reviews, status: :ok
    else
      render json: { message: "No results were found"}
    end
  end

  private
  def blank(params)
    if params == ""
      params = false 
    else
      params
    end
  end

 def set_attributes(params)
  attributes = { }
  list = [:content, :flagged, :image_url]
  list.each do |l|
    if params[l]
      attributes.merge!(l => params[l])
    end
  end
  attributes
end

end