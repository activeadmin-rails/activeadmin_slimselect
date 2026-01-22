# frozen_string_literal: true

ActiveAdmin.register Post do
  permit_params :title, :description, :category, :published, :author_id, tag_ids: []

  filter :title
  filter :author, as: :slimselect
  filter :category, as: :slimselect, collection: %w[Technology Science Arts Sports]
  filter :tags, as: :slimselect, multiple: true

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :author, as: :slimselect
      f.input :category, as: :slimselect, collection: %w[Technology Science Arts Sports]
      f.input :tags, as: :slimselect
      f.input :published
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :category
    column :tags do |post|
      post.tags.map(&:name).join(", ")
    end
    column :published
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :author
      row :category
      row :tags do |post|
        post.tags.map(&:name).join(", ")
      end
      row :published
    end
  end
end
