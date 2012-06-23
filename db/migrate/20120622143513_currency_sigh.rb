class CurrencySigh < ActiveRecord::Migration
  def change
    change_column :expenses, :amount, :decimal, :precision => 8, :scale => 2
  end
end
