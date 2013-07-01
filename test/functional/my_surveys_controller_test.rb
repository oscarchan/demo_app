require 'test_helper'

class MySurveysControllerTest < ActionController::TestCase
  setup do
    @my_survey = my_surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_survey" do
    assert_difference('MySurvey.count') do
      post :create, my_survey: {  }
    end

    assert_redirected_to my_survey_path(assigns(:my_survey))
  end

  test "should show my_survey" do
    get :show, id: @my_survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_survey
    assert_response :success
  end

  test "should update my_survey" do
    put :update, id: @my_survey, my_survey: {  }
    assert_redirected_to my_survey_path(assigns(:my_survey))
  end

  test "should destroy my_survey" do
    assert_difference('MySurvey.count', -1) do
      delete :destroy, id: @my_survey
    end

    assert_redirected_to my_surveys_path
  end
end
