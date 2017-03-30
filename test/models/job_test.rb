require 'test_helper'

class JobTest < ActiveSupport::TestCase

  def setup
      @jobone = jobs(:jobone)
      @jobtwo = jobs(:jobtwo)
    end

    test "employer must be present" do
      assert_equal 'Richard Branson', @jobone.employer.name,  'The employer name is not found'
    end

    # test "standin must be present for accepted requests" do
    #   assert_equal 'JR Tolkien', @lunch.standin.name,  'The requestor name is not found'
    # end
    #
    # test " request should not be valid without an requestor" do
    #   assert_not @nil_requestor.valid?,  'the request should not be valid without a requestor'
    # end
    #
    #
    # test " request should not be validate without an event" do
    #   p @nil_event.event
    #   assert_not @nil_event.valid?,  'the request should not be valid'
    # end

end
