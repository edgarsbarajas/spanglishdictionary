class DefinedWord < ApplicationRecord
  belongs_to :user
  belongs_to :origin
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :user, :origin, :word, :definition, presence: true

  accepts_nested_attributes_for :votes
end
