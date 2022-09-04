class SpendingQuery
  attr_reader :spendings, :category

  def initialize(spendings, category, group_by, date)
    @spendings = spendings
    @category = category
    @group_by = group_by
    @date = date
  end

  def call
    filter_by_category
    group_by_clause
    @spendings
  end

  private

  attr_reader :group_by, :date

  def group_by_clause
    case group_by
    when 'day'
      @spendings = spendings.where('created_at >= ? AND created_at <= ?', date.beginning_of_day, date.end_of_day)
    when 'month'
      @spendings = spendings.where('created_at >= ? AND created_at <= ?', date.beginning_of_month, date.end_of_month)
    when 'year'
      @spendings = spendings.where('created_at >= ? AND created_at <= ?', date.beginning_of_year, date.end_of_year)
    end
  end

  def filter_by_category
    @spendings = spendings.where(category: category) if category
  end
end
