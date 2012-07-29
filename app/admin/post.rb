ActiveAdmin.register Post do
  form do |f|
    f.inputs "Post Details" do
      f.input :band_site
      f.input :title
      f.input :body
    end
    f.buttons
  end
end
