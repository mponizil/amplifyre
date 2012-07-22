ActiveAdmin.register BandSite do
  form do |f|
    f.inputs "Band Site Details" do
      f.input :user
      f.input :slug
      f.input :name
      f.input :title
      f.input :description
      f.input :phrase
    end
    f.buttons
  end
end
