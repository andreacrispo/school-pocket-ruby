class AddCreditToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :credit, :decimal
  end
end
