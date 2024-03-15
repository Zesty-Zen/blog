class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :commenter, presence: true
  validates :body, presence: true


  
  # after_initialize :set_default_status
  # private
  # def set_default_status
  #   self.status ||= 'public' 
  # end
end
