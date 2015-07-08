class ReviewsController < ApplicationController
  before_action :authenticate_with_token!

  def create
    @review = Review.new(content: params[:content],
                         user_id: params[:user_id],
                         establishment_id: params[:establishment_id],
                         flagged: params[:flagged])
    if @review.save
      # render json "register.json.jbuilder", status: :created
      render json: { review: @review.as_json(only: [:content, :user_id, 
                                                    :establishment_id, :flagged]) },
        status: :created
    else
      render json: { errors: @user.errors.full_messages },
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
                                                  :establishment_id, :flagged]) },
      status: :ok
    end
  end

  def update

  end

end