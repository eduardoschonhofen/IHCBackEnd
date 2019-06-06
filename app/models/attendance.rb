class Attendance < ApplicationRecord
  belongs_to :discipline
  belongs_to :student
end
