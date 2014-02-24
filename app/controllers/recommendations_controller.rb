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
	
  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.update_attributes(recommendation_params)
      redirect_to recommendation_path(@recommendation.id)
    else
      render 'edit'
    end  
  end

  	def show
       @recommendation = Recommendation.find(params[:id])
  	end

    def destroy
      @recommendation = Recommendation.find(params[:id])
      @recommendation.destroy
      redirect_to recommendations_path
    end
    
    private
  def recommendation_params
    params.require(:recommendation).permit(:title, :body, :user_id)
  end

end
