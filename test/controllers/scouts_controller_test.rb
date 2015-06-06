require 'test_helper'

class ScoutsControllerTest < ActionController::TestCase
  setup do
    @scout = scouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scout" do
    assert_difference('Scout.count') do
      post :create, scout: { address_id: @scout.address_id, age: @scout.age, allergies: @scout.allergies, birthplace: @scout.birthplace, email: @scout.email, first_name: @scout.first_name, last_name: @scout.last_name, past_diseases: @scout.past_diseases, patrol: @scout.patrol, phone_number: @scout.phone_number, position: @scout.position, promise_made_on: @scout.promise_made_on, rank: @scout.rank, team_id: @scout.team_id, vaccinations: @scout.vaccinations }
    end

    assert_redirected_to scout_path(assigns(:scout))
  end

  test "should show scout" do
    get :show, id: @scout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scout
    assert_response :success
  end

  test "should update scout" do
    patch :update, id: @scout, scout: { address_id: @scout.address_id, age: @scout.age, allergies: @scout.allergies, birthplace: @scout.birthplace, email: @scout.email, first_name: @scout.first_name, last_name: @scout.last_name, past_diseases: @scout.past_diseases, patrol: @scout.patrol, phone_number: @scout.phone_number, position: @scout.position, promise_made_on: @scout.promise_made_on, rank: @scout.rank, team_id: @scout.team_id, vaccinations: @scout.vaccinations }
    assert_redirected_to scout_path(assigns(:scout))
  end

  test "should destroy scout" do
    assert_difference('Scout.count', -1) do
      delete :destroy, id: @scout
    end

    assert_redirected_to scouts_path
  end
end
