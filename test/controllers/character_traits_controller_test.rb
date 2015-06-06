require 'test_helper'

class CharacterTraitsControllerTest < ActionController::TestCase
  setup do
    @character_trait = character_traits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_traits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_trait" do
    assert_difference('CharacterTrait.count') do
      post :create, character_trait: { kind: @character_trait.kind, name: @character_trait.name }
    end

    assert_redirected_to character_trait_path(assigns(:character_trait))
  end

  test "should show character_trait" do
    get :show, id: @character_trait
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_trait
    assert_response :success
  end

  test "should update character_trait" do
    patch :update, id: @character_trait, character_trait: { kind: @character_trait.kind, name: @character_trait.name }
    assert_redirected_to character_trait_path(assigns(:character_trait))
  end

  test "should destroy character_trait" do
    assert_difference('CharacterTrait.count', -1) do
      delete :destroy, id: @character_trait
    end

    assert_redirected_to character_traits_path
  end
end
