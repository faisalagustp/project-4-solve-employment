class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy]

  # GET /employers
  # GET /employers.json
  def index
    @employers = Employer.all
  end

  # GET /employers/1
  # GET /employers/1.json
  def show
   average_rating
   latest_three_reviews
  end

  # GET /employers/new
  def new
    @employer = Employer.new
  end

  # GET /employers/1/edit
  def edit
  end

  # POST /employers
  # POST /employers.json
  def create
    @employer = Employer.new(employer_params)

    respond_to do |format|
      if @employer.save
        format.html { redirect_to @employer, notice: 'Employer was successfully created.' }
        format.json { render :show, status: :created, location: @employer }
      else
        format.html { render :new }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to @employer, notice: 'Employer was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer }
      else
        format.html { render :edit }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    @employer.destroy
    respond_to do |format|
      format.html { redirect_to employers_url, notice: 'Employer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_params
      params.require(:employer).permit(:name, :company)
    end

    def average_rating
      @employer = Employer.find(params[:id])
      @total_rating = 0
      @total_reviews = 0
      @employer.jobs.each do |job|
        job.job_applications.where("status" == "successful").each do |application|
          @total_rating += application.rating_employer.to_i
          if application.rating_employer
          @total_reviews += 1
          end
        end
      end

      if @total_reviews.to_i > 0
      @average_rating = (@total_rating / @total_reviews).round(2)
      else
        @average_rating = 0
      end
    end

    def latest_three_reviews
      @employer = Employer.find(params[:id])
      @all_reviews = []
      @employer.jobs.each do |job|
      job.job_applications.each do |app|
        if app.rating_employer
          @all_reviews << app
        end
      end
    end
      @recent_reviews = @all_reviews.sort_by {|review| review.updated_at}
      @recent_reviews.reverse!.take(3)
    end

end
