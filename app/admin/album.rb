ActiveAdmin.register Album do
  form do |f|
    f.inputs "Album Details" do
      f.input :band_site
      f.input :cover_file
      f.input :title
      f.input :description
    end
    f.buttons
  end
end
