class ReviewsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show, :update, :delete]

  def create
    @review = Review.new(content: params[:content],
                         user_id: params[:user_id],
                         establishment_id: params[:establishment_id],
                         flagged: params[:flagged],
                         image_url: params[:image_url])
    if @review.save
      # render json "register.json.jbuilder", status: :created
      render json: { review: @review.as_json(only: [:content, :user_id, 
                                                    :establishment_id, :flagged,
                                                    :image_url]) },
      status: :created
    else
      render json: { errors: @review.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def index
    @review = Review.all
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
    @review = Review.find_by(id: params[:id])
    attributes = {
      content: params[:content],
      flagged: params[:flagged],
      image_url: params[:image_url]
    }
    if current_user.id == @review.user_id
      if @review.update(attributes)
        render json: { user: @review.as_json(only: [:id, :content, :user_id, 
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

end