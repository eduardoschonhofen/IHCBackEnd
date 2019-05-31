class Account < ApplicationRecord
  belongs_to :user, polymorphic: true

  before_save -> { capitalize_attributes(["name"]) }

  VALID_CARD_NUMBER_REGEX = /\A\d+\z/i
  VALID_PASSWORD_REGEX = /\A([a-z].*\d|\d.*[a-z])\z/i

  validates :name, presence: true, length: { maximum: 64 }
  validates :card_number, presence: true, length: { is: 8 }, format: { with: VALID_CARD_NUMBER_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 32 }, allow_nil: true,
  format: { with: VALID_PASSWORD_REGEX, message: "deve conter pelo menos uma letra e um número" }

  has_secure_password

  # Returns the hash digest of the given string.
  def Account.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
