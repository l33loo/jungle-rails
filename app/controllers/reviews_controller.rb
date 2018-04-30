class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:id])
    @review = @product.reviews.new(review_params)
    redirect_to [:root], notice: 'Review successfully posted!'

  #   # if @review.save
  #   #   redirect_to [@product], notice: 'Review successfully posted!'
  #   # else
  #   #   error
  #   # end
  # end

  private

  def review_params
    params.require(:product).permit(:description, :rating)
  end
end
