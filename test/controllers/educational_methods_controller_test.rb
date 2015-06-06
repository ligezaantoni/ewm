require 'test_helper'

class EducationalMethodsControllerTest < ActionController::TestCase
  setup do
    @educational_method = educational_methods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:educational_methods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create educational_method" do
    assert_difference('EducationalMethod.count') do
      post :create, educational_method: { name: @educational_method.name }
    end

    assert_redirected_to educational_method_path(assigns(:educational_method))
  end

  test "should show educational_method" do
    get :show, id: @educational_method
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @educational_method
    assert_response :success
  end

  test "should update educational_method" do
    patch :update, id: @educational_method, educational_method: { name: @educational_method.name }
    assert_redirected_to educational_method_path(assigns(:educational_method))
  end

  test "should destroy educational_method" do
    assert_difference('EducationalMethod.count', -1) do
      delete :destroy, id: @educational_method
    end

    assert_redirected_to educational_methods_path
  end
end
