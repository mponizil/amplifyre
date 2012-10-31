module BandSitesHelper

  def band_site_dashboard_path(band_site)
    request.protocol + request.domain + '/' + band_site.slug + '/dashboard'
  end

  def view_band_site_path(band_site)
    request.protocol + band_site.slug + '.' + request.domain
  end

  def edit_band_site_path(band_site)
    request.protocol + band_site.slug + '.' + request.domain + '/edit'
  end

end
