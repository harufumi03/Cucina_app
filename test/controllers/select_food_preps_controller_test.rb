require "test_helper"

class SelectFoodPrepsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get select_food_preps_index_url
    assert_response :success
  end

  test "should get new" do
    get select_food_preps_new_url
    assert_response :success
  end

  test "should get create" do
    get select_food_preps_create_url
    assert_response :success
  end

  test "should get destroy" do
    get select_food_preps_destroy_url
    assert_response :success
  end
end
