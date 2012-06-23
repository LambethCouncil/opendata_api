object false
 
node :total do 
  @total
end

child @expenses do
    attributes :id, :supplier, :date
    node :amount do |expense|
      expense.amount.to_f
    end
end
 
