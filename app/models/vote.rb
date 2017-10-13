class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, :voteable, :value, :upvote, presence: true
end
