require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.m-site-navigation li a', minimum: 4
    assert_select '.m-store-list-item', 3
    assert_select '.m-store-list-item-price', /\$[,\d]+\.\d\d/
  end

end
