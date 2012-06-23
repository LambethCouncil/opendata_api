class ChangeSomeExpensesColumns < ActiveRecord::Migration
  def up
    change_column :expenses, :amount, :decimal
    rename_column :expenses, :month, :date
  end

  def down
    change_column :expeses, :amount, :float
    rename_column :expenses, :date, :month
  end
end
