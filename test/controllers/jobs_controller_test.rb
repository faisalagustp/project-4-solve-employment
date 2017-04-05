require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:jobone)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { description: @job.description,
        employer_id: @job.employer_id,
        title: @job.title,
        wage: @job.wage,
        contact_person: @job.contact_person,
        contact_number: @job.contact_number,
        contact_email: @job.contact_email,
        device: @job.device,
        software: @job.software,
        skills: @job.skills,
        job_type: @job.job_type,
        duration: @job.duration,
        time_commitment: @job.time_commitment,
        training: @job.training,
        location: @job.location,
        positions: @job.positions,
        start_date: @job.start_date
         } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { description: @job.description, employer_id: @job.employer_id, title: @job.title, wage: @job.wage } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
