class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.string :email
      t.string :title
      t.text :description
      t.string :tags
      t.text :bio
      t.string :github
      t.string :twitter
      t.string :recidence
      t.text :motivation

      t.timestamps
    end
  end
end
