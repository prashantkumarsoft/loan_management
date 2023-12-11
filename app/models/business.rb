class Business < ApplicationRecord
  validates :loan_amount, presence: true, numericality: { greater_than: 0 }
  has_many :financial_statements, dependent: :destroy

  def calculate_pre_assessment
    return unless financial_statements.count == 12 

    total_profit_or_loss = financial_statements.sum(:profit_or_loss)
    average_assets_value = financial_statements.average(:assets_value)
    loan_amount = self.loan_amount.to_f

    if total_profit_or_loss > 0
      self.pre_assessment = 60
    elsif average_assets_value > loan_amount
      self.pre_assessment = 100
    else
      self.pre_assessment = 20
    end

    save
  end

  def fetch_balance_sheet_value
    financial_data = financial_statements
                      .order(year: :desc, month: :desc)
                      .limit(12)
                      .pluck(:year, :month, :profit_or_loss, :assets_value)

    {
      financial_data: financial_data
    }
  end
end
