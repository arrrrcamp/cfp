class AddsIdentifierToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :identifier, :string, null: false
  end
end
