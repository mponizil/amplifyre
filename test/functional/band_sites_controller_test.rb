require 'test_helper'

class BandSitesControllerTest < ActionController::TestCase
  setup do
    @band_site = band_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_site" do
    assert_difference('BandSite.count') do
      post :create, band_site: { description: @band_site.description, name: @band_site.name, phrase: @band_site.phrase, slug: @band_site.slug, title: @band_site.title }
    end

    assert_redirected_to band_site_path(assigns(:band_site))
  end

  test "should show band_site" do
    get :show, id: @band_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band_site
    assert_response :success
  end

  test "should update band_site" do
    put :update, id: @band_site, band_site: { description: @band_site.description, name: @band_site.name, phrase: @band_site.phrase, slug: @band_site.slug, title: @band_site.title }
    assert_redirected_to band_site_path(assigns(:band_site))
  end

  test "should destroy band_site" do
    assert_difference('BandSite.count', -1) do
      delete :destroy, id: @band_site
    end

    assert_redirected_to band_sites_path
  end
end
