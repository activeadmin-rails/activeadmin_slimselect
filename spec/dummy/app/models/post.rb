# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, inverse_of: :posts

  has_many :post_tags, inverse_of: :post, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, allow_blank: false, presence: true
end
