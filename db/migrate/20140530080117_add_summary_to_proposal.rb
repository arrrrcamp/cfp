class AddSummaryToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :summary, :text
  end
end
