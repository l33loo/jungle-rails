class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    review_params = params[:review]
    review = Review.new(description: review_params[:description], rating: review_params[:rating], user_id: session[:id], product_id: params[:product_id])
      puts "PARAAAAAMS #{review_params[:description]}"

    if review.save
      redirect_to :back, notice: 'Review successfully posted!'
    else
      puts "error posting review"
    end
  end

  private

  # def review_params
  #   params.require(:review).permit(:description, :rating)
  # end
end
