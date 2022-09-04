class SpendingsController < ApplicationController
  before_action :set_spending, only: [:show, :edit, :update, :destroy]

  def index
    @spendings = SpendingQuery.new(Spending.all.accessible_for(current_user), params[:category], params[:group_by], grouped_by_date).call
  end

  def show
  end

  def new
    @spending = Spending.new
  end

  def edit
  end

  def create
    @spending = Spending.create(spending_params)
    redirect_to spending_path(@spending)
  end

  def update
    @spending.update(spending_params)
    redirect_to spending_path(@spending)
  end

  def destroy
    @spending.destroy
    redirect_to spendings_path
  end

  private

  def grouped_by_date
    case params[:group_by]
    when 'day'
      DateTime.strptime(params[:date], '%d-%m-%Y')
    when 'month'
      DateTime.strptime(params[:date], '%m-%Y')
    when 'year'
      DateTime.strptime(params[:date], '%Y')
    end
  end

  def set_spending
    @spending = Spending.find(params[:id])
  end

  def spending_params
    params[:spending].permit(:title, :description, :category, :user_id, :amount, :created_at)
  end
end

