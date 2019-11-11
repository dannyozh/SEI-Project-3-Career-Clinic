require 'test_helper'

class EmployersProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employers_profile = employers_profiles(:one)
  end

  test "should get index" do
    get employers_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_employers_profile_url
    assert_response :success
  end

  test "should create employers_profile" do
    assert_difference('EmployersProfile.count') do
      post employers_profiles_url, params: { employers_profile: {  } }
    end

    assert_redirected_to employers_profile_url(EmployersProfile.last)
  end

  test "should show employers_profile" do
    get employers_profile_url(@employers_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_employers_profile_url(@employers_profile)
    assert_response :success
  end

  test "should update employers_profile" do
    patch employers_profile_url(@employers_profile), params: { employers_profile: {  } }
    assert_redirected_to employers_profile_url(@employers_profile)
  end

  test "should destroy employers_profile" do
    assert_difference('EmployersProfile.count', -1) do
      delete employers_profile_url(@employers_profile)
    end

    assert_redirected_to employers_profiles_url
  end
end
