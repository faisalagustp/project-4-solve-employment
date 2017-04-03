class EmployeeMailer < ApplicationMailer
  default from: 'donotreplysolveemployment@gmail.com'

  def hire_notification (employee, job)
    @employee = employee
      @job = job
      @url = "https://solve-employment.herokuapp.com"
      mail(to: @employee.user.email, subject: 'Job Application Successful')
  end
end
