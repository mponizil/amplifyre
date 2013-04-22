ActiveAdmin.register Concert do
  form do |f|
    f.inputs "Concert Details" do
      f.input :band_site
      f.input :date
      f.input :details
      f.input :photo_file
      f.input :venue
      f.input :link
    end
    f.buttons
  end
end
