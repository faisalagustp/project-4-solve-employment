class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # only employers can create new jobs
  before_action :employer?, only: [:new]
  # only employers who created the jobs can crud their jobs
  before_action :own_job?, only: [:edit, :update, :destroy]
  # employers cannot edit or delete the job after the job has been filled
  #before_action :job_filled?, only: [:edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    if current_user.role == 'employee'

      @job_applications_made = current_user.employee.job_applications
      @jobs_applied = @job_applications_made.map {|application_made| application_made.job}
      puts "the jobs applied array is #{@jobs_applied}"
      @jobs_not_applied = []
      @jobs.each do |job|
        if(@jobs_applied.include?(job)==false)
          @jobs_not_applied << job
        end
      end

      @job_opportunities = []
      @jobs_not_applied.each do |job|
        hired_count = JobApplication.where(job_id: job.id, status: 'Successful').count
        if (job.positions - hired_count > 0)
          @job_opportunities << job
        end
      puts "the jobs not applied array is #{@jobs_not_applied}"
      end
    else
      @jobs = current_user.employer.jobs
      @hired_list = []
      @vacancies_list = []
      @jobs.each do |job|
        hired_count = JobApplication.where(job_id: job.id, status: 'Successful').count
        @hired_list << hired_count
        @vacancies_list << job.positions - hired_count
      end
    end
  end

  def searched
    if params[:search] == '' || params[:search] == nil
      @jobs_searched = []
      respond_to do |format|
        format.html
        format.js
      end
    else
      @jobs_searched = search(params[:search])
      respond_to do |format|
        format.html
        format.js
      end
    end
    puts "jobs searched are #{@jobs_searched.inspect}"
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])
    @job_applications = JobApplication.where(job_id: params[:id])
    @hired = JobApplication.where(job_id: params[:id], status: 'Successful')
    @vacancies = @job.positions - @hired.length
  end

  # GET /jobs/new
  def new
    p current_user
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def employer?
    if !current_user.employer
      redirect_to :jobs, :alert => "Hi there, it seems that you might be lost!"
    end
    end

    def own_job?
    if @job.employer_id != current_user.employer_id
      redirect_to :jobs, :alert => "Hi there, it seems that you might be lost!"
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :wage, :employer_id, :employee_id, :positions)
    end

    def search(search)
    if search
      Job.where('title ILIKE ?', "%#{search}%")
    end
    end


    # def job_filled?
    #   if @job.employee
    #     redirect_to :job, :alert => "Sorry, the job cannot be changed once post has been filled"
    #   end
    # end
end
