module BandSitesHelper

  def view_band_site_path(band_site)
    if request.domain.starts_with?('amplifyre')
      request.protocol + band_site.slug + '.' + request.domain
    else
      if request.subdomain.present?
        request.protocol + request.subdomain + '.' + request.domain
      else
        request.protocol + request.domain
      end
    end
  end

  def edit_band_site_path(band_site)
    if request.domain.starts_with?('amplifyre')
      request.protocol + band_site.slug + '.' + request.domain + '/edit'
    else
      if request.subdomain.present?
        request.protocol + request.subdomain + '.' + request.domain + '/edit'
      else
        request.protocol + request.domain
      end
    end
  end

end
