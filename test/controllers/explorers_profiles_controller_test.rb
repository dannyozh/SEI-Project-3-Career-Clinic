require 'test_helper'

class ExplorersProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @explorers_profile = explorers_profiles(:one)
  end

  test "should get index" do
    get explorers_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_explorers_profile_url
    assert_response :success
  end

  test "should create explorers_profile" do
    assert_difference('ExplorersProfile.count') do
      post explorers_profiles_url, params: { explorers_profile: {  } }
    end

    assert_redirected_to explorers_profile_url(ExplorersProfile.last)
  end

  test "should show explorers_profile" do
    get explorers_profile_url(@explorers_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_explorers_profile_url(@explorers_profile)
    assert_response :success
  end

  test "should update explorers_profile" do
    patch explorers_profile_url(@explorers_profile), params: { explorers_profile: {  } }
    assert_redirected_to explorers_profile_url(@explorers_profile)
  end

  test "should destroy explorers_profile" do
    assert_difference('ExplorersProfile.count', -1) do
      delete explorers_profile_url(@explorers_profile)
    end

    assert_redirected_to explorers_profiles_url
  end
end
