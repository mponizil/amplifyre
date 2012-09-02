module BandSitesHelper

  def band_site_dashboard_path(band_site)
    "http://amplifyre.dev/#{band_site.slug}/dashboard"
  end

  def view_band_site_path(band_site)
    "http://#{band_site.slug}.amplifyre.dev"
  end

  def edit_band_site_path(band_site)
    "http://#{band_site.slug}.amplifyre.dev/edit"
  end

end
