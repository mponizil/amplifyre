ActiveAdmin.register Concert do
  form do |f|
    f.inputs "Concert Details" do
      f.input :band_site
      f.input :details
      f.input :photo
      f.input :venue
    end
    f.buttons
  end
end
