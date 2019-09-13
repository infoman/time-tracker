class DateFilter
  include ActiveModel::Model

  attr_reader :from, :to

  def from=(date)
    @from = Date.parse date rescue nil
  end

  def to=(date)
    @to = Date.parse date rescue nil
  end
end
