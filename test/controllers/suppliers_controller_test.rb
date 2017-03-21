require 'test_helper'

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get suppliers_create_url
    assert_response :success
  end

  test "should get show" do
    get suppliers_show_url
    assert_response :success
  end

  test "should get edit" do
    get suppliers_edit_url
    assert_response :success
  end

  test "should get new" do
    get suppliers_new_url
    assert_response :success
  end

end
