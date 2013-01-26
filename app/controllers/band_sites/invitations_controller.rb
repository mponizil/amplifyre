class BandSites::InvitationsController < Devise::InvitationsController
  before_filter :get_site_from_slug, :only => [:create]

  # POST /bringtheloot/invitation
  def create
    user = User.find_by_email(resource_params[:email])

    if user
      @band_site.user_ids += [user[:id]]
      flash[:notice] = I18n.t 'collaborator.added', :email => user.email
      return redirect_to band_site_collaborators_path
    end

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
    @band_site = BandSite.find_by_slug(params[:slug])
    if not @band_site
      redirect_to user_root_path
    end
  end
end
