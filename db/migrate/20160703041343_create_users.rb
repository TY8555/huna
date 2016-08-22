class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_email
      t.string :password
      t.string :nickname
      t.integer :age
      t.string :school
      t.string :major
      t.string :images,  :default => ""
      t.string :kakao
      t.boolean :sex
      t.string :student_number

      
      t.timestamps null: false
    end
  end
end
  