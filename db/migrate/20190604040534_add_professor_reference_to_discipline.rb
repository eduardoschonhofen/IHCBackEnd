class AddProfessorReferenceToDiscipline < ActiveRecord::Migration[5.2]
  def change
    add_reference :disciplines, :professor, foreign_key: true
  end
end
