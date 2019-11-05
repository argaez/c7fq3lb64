class ExpensesController < ApplicationController
  def index
  	concept = params[:concept]
  	category_id = params[:category_id]
  	if !concept.blank? && !category_id.blank?
    	@expenses = Expense.where("concept like '%#{concept}%' and category_id = #{category_id}").order("date DESC")
  	elsif concept.blank? && !category_id.blank?
  		@expenses = Expense.where("category_id = #{category_id}").order("date DESC")
  	elsif !concept.blank? && category_id.blank?
  		@expenses = Expense.where("concept like '%#{concept}%'").order("date DESC")
  	else
  		@expenses = Expense.order("date DESC")
  	end

  end
end
