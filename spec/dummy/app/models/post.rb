# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, inverse_of: :posts

  has_many :post_tags, inverse_of: :post, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, allow_blank: false, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[author_id category created_at description id published title updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[author post_tags tags]
  end
end
