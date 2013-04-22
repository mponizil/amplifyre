ActiveAdmin.register Page do
  form do |f|
    f.inputs "Page Details" do
      f.input :band_site
      f.input :position
      f.input :title
      f.input :slug
      f.input :category
      f.input :body
    end
    f.buttons
  end
end
