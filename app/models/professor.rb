class Professor < ApplicationRecord
  has_one :account, as: :user
end
