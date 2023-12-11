class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :fetch_balance_sheet, :submit_application]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to @business, notice: 'Business details were successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def fetch_balance_sheet
    if @business.financial_statements.empty?
      12.times do |month|
        FinancialStatement.create(
          year: 2021,
          month: month + 1, 
          profit_or_loss: rand(-50000..50000),
          assets_value: rand(50000..200000),
          business: @business
        )
      end 
    end
    @balance_sheet = @business.fetch_balance_sheet_value

    respond_to do |format|
      format.html { render :show }   
    end
  end

  def submit_application
    @business.calculate_pre_assessment

    redirect_to @business, notice: 'Application submitted successfully!'
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :year_established, :loan_amount)
  end
end
