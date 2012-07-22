ActiveAdmin.register User do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
    end
    f.buttons
  end

  after_create { |admin| admin.send_reset_password_instructions }

  def password_required?
    new_record? ? false : super
  end

end
