ActiveAdmin.register Track do
  form do |f|
    f.inputs "Track Details" do
      f.input :band_site
      f.input :album
      f.input :title
      f.input :artist
      f.input :file
    end
    f.buttons
  end
end
