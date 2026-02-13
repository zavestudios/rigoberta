class Comment < ApplicationRecord
  belongs_to :article
  broadcasts_to :article
  validates :content, presence: true
end
