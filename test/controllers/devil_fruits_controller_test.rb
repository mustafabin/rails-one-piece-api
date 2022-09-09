require "test_helper"

class DevilFruitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @devil_fruit = devil_fruits(:one)
  end

  test "should get index" do
    get devil_fruits_url, as: :json
    assert_response :success
  end

  test "should create devil_fruit" do
    assert_difference("DevilFruit.count") do
      post devil_fruits_url, params: { devil_fruit: { name: @devil_fruit.name, type: @devil_fruit.type, user_id: @devil_fruit.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show devil_fruit" do
    get devil_fruit_url(@devil_fruit), as: :json
    assert_response :success
  end

  test "should update devil_fruit" do
    patch devil_fruit_url(@devil_fruit), params: { devil_fruit: { name: @devil_fruit.name, type: @devil_fruit.type, user_id: @devil_fruit.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy devil_fruit" do
    assert_difference("DevilFruit.count", -1) do
      delete devil_fruit_url(@devil_fruit), as: :json
    end

    assert_response :no_content
  end
end
