class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  # user needs to be signed in
  before_action :authenticate_user!
  # only employees can create job applications
  before_action :employee?, only: [:new, :create]
  # employee can only create 1 application for each job
  before_action :already_applied?, only: [:create]
  # only employer of the job can change the status of the employee's job application
  before_action :employee_employer?, only: [:edit, :update]


  # GET /job_applications
  # GET /job_applications.json
  def index
    if current_user.role == 'employee'
      @job_applications_made = current_user.employee.job_applications
    else
      @job_applications = JobApplication.all
    end
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
  def edit
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)
    if @job_application.save
      flash[:notice] = "Your application has been made successfully"
      respond_to do |format|
        format.html {redirect_to jobs_path}
        format.js
      end
    else
    flash[:error] = "Error saving your application"
    respond_to do |format|
      format.html
      format.js
    end
    end
  end

  def upload
  uploaded_io = params[:job_application][:coverletter]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end
  end

  def hire
    respond_to do |format|
    @job_application = JobApplication.find(params[:id])
    if @job_application.update(hire_params)
      EmployeeMailer.hire_notification(@job_application.employee, @job_application.job).deliver
      @job = Job.find(@job_application.job_id)
      @hired = JobApplication.where(status: "Successful", job_id: @job.id)
      @vacancies = @job.positions
      if @hired.length == @vacancies
        @job_apps_rejected = JobApplication.where(status: "In Progress", job_id: @job.id)
        @job_apps_rejected.each do |job_app_rej|
          job_app_rej.update(status: "Unsuccessful")
        end
      end
      format.html { redirect_to jobs_path, notice: 'Email has been sent to the successful applicant' }
      format.json { render :show, status: :ok, location: @job }
    else
      format.html { render :edit }
      format.json { render json: @job_application.errors, status: :unprocessable_entity }
    end
  end
  end
  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        @job = Job.find(@job_application.job_id)
        @hired = JobApplication.where(status: "Successful", job_id: @job.id)
        @vacancies = @job.positions
        if @hired.length == @vacancies
          @job_apps_rejected = JobApplication.where(status: "In Progress", job_id: @job.id)
          @job_apps_rejected.each do |job_app_rej|
            job_app_rej.update(status: "Unsuccessful")
          end
        end
        format.html { redirect_to job_path, notice: 'The employee was successfully hired' }
        format.json { render :show, status: :ok, location: @job }
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
      params.require(:job_application).permit(:coverletter, :job_id, :employee_id, :status, :review_employee, :rating_employee, :rating_employer, :review_employer)
    end

    def hire_params
      params.require(:job_application).permit(:status)
    end

    def employee?
    if !current_user.employee
      redirect_to :jobs, :alert => "Sorry, access denied!"
    end
    end

    def already_applied?
      current_user.employee.job_applications.each do |app|
        if app.job_id == params[:job_application][:job_id].to_i
          # p "employee has already applied"
          redirect_to :jobs, :alert => "Sorry, you can only apply for a job once!"
        end
      end
    end

    def employee_employer?
      if current_user.role == "employer"
        if @job_application.job.employer != current_user.employer
        redirect_to :jobs, :alert => "Sorry, access denied!"
      end
    elsif current_user.role == "employee"
      if @job_application.employee != current_user.employee
        redirect_to :jobs, :alert => "Sorry, access denied!"
    end
  end
end


end
