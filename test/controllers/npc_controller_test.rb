require 'test_helper'

class NpcControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get npc_index_url
    assert_response :success
  end

end
