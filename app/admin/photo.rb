ActiveAdmin.register Photo do
  form do |f|
    f.inputs "Photo Details" do
      f.input :band_site
      f.input :file
    end
    f.buttons
  end
end
