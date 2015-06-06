require 'test_helper'

class RelatedPeopleControllerTest < ActionController::TestCase
  setup do
    @related_person = related_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:related_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create related_person" do
    assert_difference('RelatedPerson.count') do
      post :create, related_person: { email: @related_person.email, first_name: @related_person.first_name, last_name: @related_person.last_name, phone_number: @related_person.phone_number, role: @related_person.role }
    end

    assert_redirected_to related_person_path(assigns(:related_person))
  end

  test "should show related_person" do
    get :show, id: @related_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @related_person
    assert_response :success
  end

  test "should update related_person" do
    patch :update, id: @related_person, related_person: { email: @related_person.email, first_name: @related_person.first_name, last_name: @related_person.last_name, phone_number: @related_person.phone_number, role: @related_person.role }
    assert_redirected_to related_person_path(assigns(:related_person))
  end

  test "should destroy related_person" do
    assert_difference('RelatedPerson.count', -1) do
      delete :destroy, id: @related_person
    end

    assert_redirected_to related_people_path
  end
end
