class Comment < ApplicationRecord
  
  enum status: [:public_comment, :private_comment, :archived_comment]
  
  belongs_to :article

  validates :commenter, presence: true
  validates :body, presence: true

end
