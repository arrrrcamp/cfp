class CreatesFeedback < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.references :proposal, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
