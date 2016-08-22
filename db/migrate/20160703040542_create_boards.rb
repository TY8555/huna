class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :board_title
      t.integer :age
      t.integer :number
      t.string :board_content
      t.string :needs_team
      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
