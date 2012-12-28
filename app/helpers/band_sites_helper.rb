module BandSitesHelper

  def view_band_site_path(band_site)
    request.protocol + band_site.slug + '.' + request.domain
  end

  def edit_band_site_path(band_site)
    request.protocol + band_site.slug + '.' + request.domain + '/edit'
  end

end
