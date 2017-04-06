require 'test_helper'

class JobTest < ActiveSupport::TestCase

  def setup
      @jobone = jobs(:jobone)
      @jobtwo = jobs(:jobtwo)
  end

    test "employer must be present" do
      assert_equal 'Richard Branson', @jobone.employer.name,  'The employer name is not found'
    end

    test "job should belong to an employer" do
      p @jobone.employer.name
      assert_equal "Richard Branson", @jobone.employer.name, 'Employer name is not Richard Branson'
    end

    test "job has a Successful job application" do
      p @jobone.job_applications[0]
      assert_equal "Successful", @jobone.job_applications[0].status, 'Job has no job application'
    end

    test "wage must be an integer" do
      p @jobtwo.wage
      assert_equal Integer, @jobtwo.wage.class, 'Wage is not an integer'
    end

    test "should not be valid if required fields absent" do
      assert_not @jobtwo.valid?, 'job is valid even if required fields absent'

    end
end
