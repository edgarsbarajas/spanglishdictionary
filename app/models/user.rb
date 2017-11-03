class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true

  has_many :defined_words
  has_many :comments
  has_many :votes

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase
  end
end
