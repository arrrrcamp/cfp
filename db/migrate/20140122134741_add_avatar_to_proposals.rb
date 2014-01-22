class AddAvatarToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :avatar, :string
  end
end
