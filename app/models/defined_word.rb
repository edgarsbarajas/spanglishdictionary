class DefinedWord < ApplicationRecord
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :user, :word, :definition, presence: true

  before_save :downcase_fields

  def downcase_fields
    self.word.downcase
  end

  def has_comment?(comment)
    self.comments.where(id: comment.id).count > 0
  end
end
