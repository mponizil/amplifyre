ActiveAdmin.register BandSite do
  controller do
    defaults finder: :find_by_slug
  end
  form do |f|
    f.inputs "Band Site Details" do
      f.input :users
      f.input :slug
      f.input :name
      f.input :title
      f.input :description
      f.input :phrase
      f.input :theme
      f.input :skin_color
      f.input :skin_style
    end
    f.buttons
  end
end
