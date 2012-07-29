ActiveAdmin.register Album do
  form do |f|
    f.inputs "Album Details" do
      f.input :band_site
      f.input :title
      f.input :cover
    end
    f.buttons
  end
end
