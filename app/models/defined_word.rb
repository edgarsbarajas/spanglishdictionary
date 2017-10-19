class DefinedWord < ApplicationRecord
  belongs_to :user
  belongs_to :origin
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :user, :origin, :word, :definition, presence: true

  def has_comment?(comment)
    self.comments.where(id: comment.id).count > 0
  end
end
