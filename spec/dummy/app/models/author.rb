# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\z/i, message: "Invalid email" }

  def to_s
    "#{name} (#{age})"
  end
end
