class CreateExpensesTable < ActiveRecord::Migration
  def up
    create_table :expenses do |t|
      t.string :supplier
      t.date :month
      t.float :amount
    end
  end

  def down
    drop_table :expenses
  end
end
