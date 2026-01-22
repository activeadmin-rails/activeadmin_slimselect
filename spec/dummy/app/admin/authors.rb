# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :name, :age, :email

  filter :name
  filter :email

  form do |f|
    f.inputs do
      f.input :name
      f.input :age
      f.input :email
    end
    f.actions
  end
end
