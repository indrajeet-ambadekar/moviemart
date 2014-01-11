class MoviesController < ApplicationController
	def show
		@movie = Movie.find(params[:id])
	end
	def index
		movie = Movie.find(params[:movie_id])
		if params[:what] == "like"
			movie.like += 1
			if movie.save
				viewer = Viewer.new
				viewer.movie_id = params[:movie_id]
				viewer.user_id = current_user[:id]
				viewer.like = 1
				viewer.save!
			end
		elsif params[:what] == "dislike"
			movie.dislike += 1
			if movie.save
				viewer = Viewer.new
				viewer.movie_id = params[:movie_id]
				viewer.user_id = current_user[:id]
				viewer.like = 0
				viewer.save!
			end
		elsif params[:what] == "nodislike"
			movie.dislike -= 1
			if movie.save
				viewer = Viewer.find_by(:user_id => current_user[:id], :movie_id => params[:movie_id])
				viewer.destroy
			end
		elsif params[:what] == "unlike"
			movie.like -= 1
			if movie.save
				viewer = Viewer.find_by(:user_id => current_user[:id], :movie_id => params[:movie_id])
				viewer.destroy
			end
		elsif params[:what] == "updatedislike"
			movie.like -= 1
			movie.dislike += 1
			if movie.save
				viewer = Viewer.find_by(:user_id => current_user[:id], :movie_id => params[:movie_id])
				viewer.like = 0
				viewer.save
			end
		elsif params[:what] == "updatelike"
			movie.like += 1
			movie.dislike -= 1
			if movie.save
				viewer = Viewer.find_by(:user_id => current_user[:id], :movie_id => params[:movie_id])
				viewer.like = 1
				viewer.save
			end
		end
		redirect_to "/movies/#{params[:movie_id]}"	
	end
end
