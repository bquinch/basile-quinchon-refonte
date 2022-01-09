class BlogPost < ApplicationRecord
  extend FriendlyId
  validates :title, :content, presence: true
  friendly_id :title, use: :slugged
end
