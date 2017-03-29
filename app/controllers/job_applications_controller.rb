class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  # user needs to be signed in
  before_action :authenticate_user!
  # only employees can create job applications
  before_action :employee?, only: [:new, :create]


  # GET /job_applications
  # GET /job_applications.json
  def index
    @job_applications = JobApplication.all
  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /job_applications/1/edit
  # employees cannot edit their job applications
  # def edit
  # end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.create!(job_application_params)
  end

  def upload
  uploaded_io = params[:job_application][:coverletter]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end
  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: 'Job application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_application_params
      params.require(:job_application).permit(:coverletter, :job_id, :employee_id, :status)
    end

    def employee?
    if !current_user.employee
      redirect_to :jobs, :alert => "Hi there, it seems that you might be lost!"
  end
end
end
