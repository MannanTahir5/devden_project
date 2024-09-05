ActiveAdmin.register Product do
  filter :cart_id

  permit_params :name, :description, :price, :category, :image, :size

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :size
    column :category
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :size, as: :select
      f.input :category, as: :select
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :size
      row :category
      
      row :image do |product|
        image_tag url_for(product.image) if product.image.attached?
      end
    end
  end
end
