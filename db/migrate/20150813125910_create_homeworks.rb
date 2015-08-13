class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.text :description
      t.date :deadline
      t.boolean :completed
      t.integer :priority
      t.references :user, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
