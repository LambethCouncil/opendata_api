class NeedMoarMoney < ActiveRecord::Migration
  def change
    change_column :expenses, :amount, :decimal, :precision => 16, :scale => 2
  end
end
