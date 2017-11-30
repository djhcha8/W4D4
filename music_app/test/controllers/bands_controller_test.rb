require 'test_helper'

class BandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get bands_index,_url
    assert_response :success
  end

  test "should get new," do
    get bands_new,_url
    assert_response :success
  end

  test "should get edit," do
    get bands_edit,_url
    assert_response :success
  end

  test "should get create," do
    get bands_create,_url
    assert_response :success
  end

  test "should get show," do
    get bands_show,_url
    assert_response :success
  end

  test "should get update," do
    get bands_update,_url
    assert_response :success
  end

  test "should get destroy" do
    get bands_destroy_url
    assert_response :success
  end

end
