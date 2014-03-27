class CreateProposalScores < ActiveRecord::Migration
  def change
    create_table :proposal_scores do |t|
      t.references :user, index: true
      t.references :proposal, index: true
      t.boolean :read, default: false
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
