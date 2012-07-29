ActiveAdmin.register Page do
  form do |f|
    f.inputs "Page Details" do
      f.input :band_site
      f.input :title
      f.input :slug
    end
    f.buttons
  end
end
