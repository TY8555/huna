class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :board, index: true, foreign_key: true
      t.string :reply_title
      t.string :reply
      t.boolean :apply, default: false, null: false
      t.timestamps null: false
    end
  end
end
