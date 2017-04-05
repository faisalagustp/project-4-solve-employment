require 'test_helper'

class JobApplicationTest < ActiveSupport::TestCase
  def setup
    @job_application_one = job_applications(:job_app_one)
    @job_application_two = job_applications(:job_app_two)

  end

  test "the cover letters must match" do
    assert_equal 'I would like to apply for this job',
    @job_application_one.coverletter, 'the cover letters dont match!'
  end

  test "belongs to the job one" do
    assert_equal 'Assistant',
    @job_application_one.job.title, 'doesnt belong to job one'
  end

  test "belongs to the employee one" do
    assert_equal 'Barack Obama',
    @job_application_one.employee.name, 'doesnt belong to employee one'
  end

  test "The status is Successful" do
    assert_equal 'Successful',
    @job_application_one.status, 'doesnt have a Successful status'
  end

  test "Testing employee rating" do
    assert_equal 4,
    @job_application_one.rating_employee, 'doesnt have rating 4 for employee'
  end

  test "Cover letter cannot be empty" do
    assert_not @job_application_two.valid?, 'the cover letter is not empty'
  end


  # test "the truth" do
  #   assert true
  # end
end
