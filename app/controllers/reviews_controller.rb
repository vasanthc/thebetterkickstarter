class ReviewsController < ApplicationController
  include ApplicationHelper

  before_filter :verify_logged_in

  def create
    @product = Product.find params[:product_id]

    @review = @product.reviews.build(params[:review])
    @review.user_id = current_user.id

    if @review.save
      flash[:notice] = "Review added!"
      redirect_to product_path(@product.id)
    else
      flash.now[:alert] = "There was an error in your review. Stop haxoring our webs"
      render "products/show"
    end
  end

  protected

  def verify_logged_in
    if current_user.blank?
      flash[:alert] = "You must log in to add a review"
      redirect_to new_session_path
    end
  end

end