class Expense < ActiveRecord::Base
  attr_accessible :amount, :supplier, :date
  
  validates_presence_of :amount
  validates_presence_of :supplier
  validates_presence_of :date
  
end