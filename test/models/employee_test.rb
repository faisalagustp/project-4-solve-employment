require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

    def setup
    @one = employees(:one)
    @two = employees(:two)
    end

    # one:
    #   name: "Barack Obama"
    #
    # two:
    #   name: ""


  test "name must be present" do
    assert_equal 'Barack Obama', @one.name,  'The expected user name is not found'
  end


    # test "event should be linked to the user who created it" do
    #   assert_equal 'Popular Ramen Restaurant', @rowling.events[0].name,  'The event name is not found'
    # end

  # test 'author.book must be Harry Potter' do
  #   assert_equal 'Harry Potter and The Chamber of Secrets', @the_author.books.name, 'The book has no book per fixture'
  # end

  # test 'the user email must be present' do
  #   # expecting a false outcome
  #   assert_not @nobody.valid?, 'user email must be validated'
  # end


    # test "the truth" do
    #   assert true
    # end

end
