require "application_system_test_case"

class ExplorersProfilesTest < ApplicationSystemTestCase
  setup do
    @explorers_profile = explorers_profiles(:one)
  end

  test "visiting the index" do
    visit explorers_profiles_url
    assert_selector "h1", text: "Explorers Profiles"
  end

  test "creating a Explorers profile" do
    visit explorers_profiles_url
    click_on "New Explorers Profile"

    click_on "Create Explorers profile"

    assert_text "Explorers profile was successfully created"
    click_on "Back"
  end

  test "updating a Explorers profile" do
    visit explorers_profiles_url
    click_on "Edit", match: :first

    click_on "Update Explorers profile"

    assert_text "Explorers profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Explorers profile" do
    visit explorers_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Explorers profile was successfully destroyed"
  end
end
