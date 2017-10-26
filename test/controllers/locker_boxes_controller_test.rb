require 'test_helper'

class LockerBoxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @locker_box = locker_boxes(:one)
  end

  test "should get index" do
    get locker_boxes_url
    assert_response :success
  end

  test "should get new" do
    get new_locker_box_url
    assert_response :success
  end

  test "should create locker_box" do
    assert_difference('LockerBox.count') do
      post locker_boxes_url, params: { locker_box: { description: @locker_box.description, identification: @locker_box.identification, name: @locker_box.name } }
    end

    assert_redirected_to locker_box_url(LockerBox.last)
  end

  test "should show locker_box" do
    get locker_box_url(@locker_box)
    assert_response :success
  end

  test "should get edit" do
    get edit_locker_box_url(@locker_box)
    assert_response :success
  end

  test "should update locker_box" do
    patch locker_box_url(@locker_box), params: { locker_box: { description: @locker_box.description, identification: @locker_box.identification, name: @locker_box.name } }
    assert_redirected_to locker_box_url(@locker_box)
  end

  test "should destroy locker_box" do
    assert_difference('LockerBox.count', -1) do
      delete locker_box_url(@locker_box)
    end

    assert_redirected_to locker_boxes_url
  end
end
