class RatingsController < OpenReadController
  before_action :set_rating, only: [:show, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :show]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all

    render json: @ratings
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    render json: @rating
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    @rating = Rating.find(params[:id])

    if @rating.update(rating_params)
      render json: @rating, status: :created
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy

    head :no_content
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:score, :user_id, :flag_id)
  end
end
