class RecommendationsController < ApplicationController
  	def index
  		@recommendations = Recommendation.all
  	end

  	def new
  	@recommendation = Recommendation.new
  	end

  	def create
  		@recommendation = Recommendation.new(recommendation_params)
  		if @recommendation.save
  			redirect_to recommendations_path
		else
			render 'new'
		end
	end
	private
	def recommendation_params
		params.require(:recommendation).permit(:title, :body, :user_id)
	end

  	def edit
  	end

  	def show
  	end
end
