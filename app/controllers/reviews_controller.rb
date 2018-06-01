class ReviewsController < ApplicationController
   def create
    @review = Review.new(review_params)
    authorize @review
    @camel = Camel.find(params[:camel_id])
    @review.camel = @camel
    if @review.save
      respond_to do |format|
        format.html { redirect_to camel_path(@camel) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'camels/show' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
