ActiveAdmin.register Social do
  form do |f|
    f.inputs "Social Details" do
      f.input :band_site
      f.input :category
      f.input :link
    end
    f.buttons
  end
end
