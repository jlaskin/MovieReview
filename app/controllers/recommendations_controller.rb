class RecommendationsController < ApplicationController
 def index
  @recommendations = Recommendation.all.order(:user_id)
end

def new
  if user_signed_in?
    @recommendation = Recommendation.new
  else
    redirect_to new_user_session_path
  end 
end

def create
  @recommendation = Recommendation.new(recommendation_params)
  if @recommendation.user_id != current_user.id
    redirect_to recommendation_path
  else
    if @recommendation.save
      Notifications.new_recommendation(current_user).deliver
      redirect_to recommendations_path
    else
      render 'new'
    end
  end
end

def edit
  if user_signed_in?
    @recommendation = Recommendation.find(params[:id])
  else
    redirect_to new_user_session_path
  end
end

def update
  @recommendation = Recommendation.find(params[:id])
  if @recommendation.user_id != current_user.id
    render 'edit'
  else 
    if @recommendation.update_attributes(recommendation_params)
      redirect_to recommendation_path(@recommendation.id)
    else
      render 'edit'
    end
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
