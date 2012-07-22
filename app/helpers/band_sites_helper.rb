module BandSitesHelper

  def band_site_dashboard_path(band_site)
    "http://amplifyre.dev:3000/#{band_site.slug}/dashboard"
  end

  def view_band_site_path(band_site)
    "http://#{band_site.slug}.amplifyre.dev:3000"
  end

  def edit_band_site_path(band_site)
    "http://#{band_site.slug}.amplifyre.dev:3000/edit"
  end

end
