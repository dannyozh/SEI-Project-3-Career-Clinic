require "application_system_test_case"

class EmployersProfilesTest < ApplicationSystemTestCase
  setup do
    @employers_profile = employers_profiles(:one)
  end

  test "visiting the index" do
    visit employers_profiles_url
    assert_selector "h1", text: "Employers Profiles"
  end

  test "creating a Employers profile" do
    visit employers_profiles_url
    click_on "New Employers Profile"

    click_on "Create Employers profile"

    assert_text "Employers profile was successfully created"
    click_on "Back"
  end

  test "updating a Employers profile" do
    visit employers_profiles_url
    click_on "Edit", match: :first

    click_on "Update Employers profile"

    assert_text "Employers profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Employers profile" do
    visit employers_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employers profile was successfully destroyed"
  end
end
