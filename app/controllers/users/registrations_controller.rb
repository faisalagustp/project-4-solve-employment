class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
    if resource.persisted?
      if resource.role == 'employer'
        @employer = Employer.create(employer_params)
        resource.update(employer_id: @employer.id)
      elsif resource.role == 'employee'
        @employee = Employee.create(employee_params)
        resource.update(employee_id: @employee.id)
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
    if resource.persisted?
      if resource.role == 'employer'
        @employer = Employer.update(employer_params)
      elsif resource.role == 'employee'
        @employee = Employee.create(employee_params)
      end
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def employer_params
    params.permit(:name,:company)
  end

  def employee_params
    params.permit(:name)
  end

end
