class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    average_rating_employee
    latest_three_reviews
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :image)
    end

    def average_rating_employee
      @employee = Employee.find(params[:id])
      @total_rating = 0
      @total_reviews = 0
      @employee.job_applications.where("status" == "successful").each do |application|
          @total_rating += application.rating_employee.to_i
          if application.rating_employee
          @total_reviews += 1
          end
      end
      if @total_reviews.to_i > 0
      @average_rating = (@total_rating / @total_reviews).round(2)
      else
        @average_rating = 0
      end
    end

    def latest_three_reviews
      @employee = Employee.find(params[:id])
      @all_reviews = []
      @employee.job_applications.each do |app|
        if app.rating_employee
          @all_reviews << app
        end
      end
      @recent_reviews = @all_reviews.sort_by {|review| review.updated_at}
      @recent_reviews.reverse!.take(3)
    end

end
