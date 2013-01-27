DeviseInvitable::Mailer::module_eval do
  def prelaunch_invitation_instructions(record, opts={})
    devise_mail(record, :prelaunch_invitation_instructions, opts)
  end
end

# Override DeviseInvitable to allow for multiple invitation email templates.
Devise::Models::Invitable::module_eval do
  attr_accessor :instructions

  protected
    def deliver_invitation
      instructions = @instructions || :invitation_instructions
      send_devise_notification(instructions)
    end
end
