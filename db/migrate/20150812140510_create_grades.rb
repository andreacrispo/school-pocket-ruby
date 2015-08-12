class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :grade
      t.date :date
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
