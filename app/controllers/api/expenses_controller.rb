class Api::ExpensesController < ApplicationController

  respond_to :html, :json, :xml

  def index
    @expenses = Expense.all
    @total = Expense.sum(:amount)
    render "expenses/index"
  end
  
  def show
    @expense = Expense.find_by_id(params[:id])
    render "expenses/show"
  end
  
  def search
    
    @expenses = Expense
    
    if params[:supplier].present?
      @expenses = @expenses.where('supplier LIKE ?',"%#{params[:supplier]}%")
    end
    
    if params[:from].present? && params[:to].present?
      from = Date.parse(params[:from])
      to = Date.parse(params[:to])
      @expenses = @expenses.where('date <= ? and date >= ?', to, from)
    end
    
    @total = @expenses.sum(:amount)
      
    unless @expenses.kind_of?(Class)
      render "expenses/index"
    end
    
  end

end