class Discipline < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_one :professor
end
