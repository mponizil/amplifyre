class BandSites::InvitationsController < Devise::InvitationsController
  before_filter :get_site_from_slug, :only => [:new, :create]

  # POST /bringtheloot/invitation
  def create
    self.resource = resource_class.invite!(resource_params, current_inviter)

    if resource.errors.empty?
      @band_site.user_ids += [resource.id]
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      redirect_to band_site_collaborators_path
    else
      respond_with_navigational(resource) { render :new }
    end
  end

private

  def get_site_from_slug
    @band_site = BandSite.where(:slug => params[:slug])[0]
    if !@band_site
      redirect_to user_root_path
    end
  end
end
