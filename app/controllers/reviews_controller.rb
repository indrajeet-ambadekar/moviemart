class ReviewsController < ApplicationController
	
	def create
		@review = User.find(current_user[:id]).reviews.new(review_params)
		@review.like = 0
  		@review.save
  		redirect_to "/movies/#{params[:review][:movie_id]}"
	end

	private
	  def review_params
	    params.require(:review).permit(:user_id, :review_text, :like, :movie_id)
	  end
end
