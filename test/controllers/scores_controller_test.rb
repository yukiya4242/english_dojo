require "test_helper"

class ScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scores_index_url
    assert_response :success
  end

  test "should get show" do
    get scores_show_url
    assert_response :success
  end

  test "should get create" do
    get scores_create_url
    assert_response :success
  end

  test "should get update" do
    get scores_update_url
    assert_response :success
  end

  test "should get destroy" do
    get scores_destroy_url
    assert_response :success
  end
end
