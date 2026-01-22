# frozen_string_literal: true

ActiveAdmin.register Tag do
  permit_params :name

  filter :name

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
