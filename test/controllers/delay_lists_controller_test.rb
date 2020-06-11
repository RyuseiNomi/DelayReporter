require 'test_helper'

class DelayListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get delay_lists_index_url
    assert_response :success
  end

end
