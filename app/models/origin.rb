class Origin < ApplicationRecord
  has_many :defined_words

  validates :country, presence: true
end
