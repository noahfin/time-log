require 'test_helper'

class DayLogsControllerTest < ActionController::TestCase
  setup do
    @day_log = day_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_log" do
    assert_difference('DayLog.count') do
      post :create, day_log: { day: @day_log.day, time_in: @day_log.time_in, time_out: @day_log.time_out }
    end

    assert_redirected_to day_log_path(assigns(:day_log))
  end

  test "should show day_log" do
    get :show, id: @day_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_log
    assert_response :success
  end

  test "should update day_log" do
    patch :update, id: @day_log, day_log: { day: @day_log.day, time_in: @day_log.time_in, time_out: @day_log.time_out }
    assert_redirected_to day_log_path(assigns(:day_log))
  end

  test "should destroy day_log" do
    assert_difference('DayLog.count', -1) do
      delete :destroy, id: @day_log
    end

    assert_redirected_to day_logs_path
  end
end
