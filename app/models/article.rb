class Article < ApplicationRecord

  enum status: [:public_article, :private_article, :archived_article]
  
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {minimum:10}

end