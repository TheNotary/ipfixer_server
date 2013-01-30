require 'test_helper'

class IpfixesControllerTest < ActionController::TestCase
  setup do
    @ipfix = ipfixes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ipfixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ipfix" do
    assert_difference('Ipfix.count') do
      post :create, ipfix: { host: @ipfix.host, ip: @ipfix.ip }
    end

    assert_redirected_to ipfix_path(assigns(:ipfix))
  end

  test "should show ipfix" do
    get :show, id: @ipfix
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ipfix
    assert_response :success
  end

  test "should update ipfix" do
    put :update, id: @ipfix, ipfix: { host: @ipfix.host, ip: @ipfix.ip }
    assert_redirected_to ipfix_path(assigns(:ipfix))
  end

  test "should destroy ipfix" do
    assert_difference('Ipfix.count', -1) do
      delete :destroy, id: @ipfix
    end

    assert_redirected_to ipfixes_path
  end
end
