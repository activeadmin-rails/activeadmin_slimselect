# frozen_string_literal: true

class PostTag < ApplicationRecord
  belongs_to :post, inverse_of: :post_tags
  belongs_to :tag, inverse_of: :post_tags

  validates :post, presence: true
  validates :tag, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id post_id tag_id updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[post tag]
  end
end
