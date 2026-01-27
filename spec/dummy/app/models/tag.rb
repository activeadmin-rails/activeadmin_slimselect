# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :post_tags, inverse_of: :tag, dependent: :destroy
  has_many :posts, through: :post_tags

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[post_tags posts]
  end
end
