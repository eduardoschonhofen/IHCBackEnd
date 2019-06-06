class Student < ApplicationRecord
  has_one :account, as: :user
end
