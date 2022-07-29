class AddReferencesToQuestionEvidence < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :category, index: true
    add_reference :evidences, :category, index: true
  end
end
