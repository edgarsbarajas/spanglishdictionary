class DefinedWord < ApplicationRecord
  belongs_to :user
  belongs_to :origin
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :user, :origin, :word, :definition, presence: true
end
