require 'test_helper'

class ExecutionReportsControllerTest < ActionController::TestCase
  setup do
    @execution_report = execution_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:execution_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create execution_report" do
    assert_difference('ExecutionReport.count') do
      post :create, execution_report: { activity_id: @execution_report.activity_id, content: @execution_report.content }
    end

    assert_redirected_to execution_report_path(assigns(:execution_report))
  end

  test "should show execution_report" do
    get :show, id: @execution_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @execution_report
    assert_response :success
  end

  test "should update execution_report" do
    patch :update, id: @execution_report, execution_report: { activity_id: @execution_report.activity_id, content: @execution_report.content }
    assert_redirected_to execution_report_path(assigns(:execution_report))
  end

  test "should destroy execution_report" do
    assert_difference('ExecutionReport.count', -1) do
      delete :destroy, id: @execution_report
    end

    assert_redirected_to execution_reports_path
  end
end
