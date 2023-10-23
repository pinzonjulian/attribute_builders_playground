require "test_helper"

class MaterialControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get material_form_url
    assert_response :success
  end

  test "should get form_source" do
    get material_form_source_url
    assert_response :success
  end

  test "should get form_builder" do
    get material_form_builder_url
    assert_response :success
  end
end
