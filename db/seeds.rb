# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

business = Business.find_or_create_by(name: 'Evergreen Innovations', year_established: 2018, loan_amount: 100000)

12.times do |month|
  FinancialStatement.create(
    year: 2021,
    month: month + 1, 
    profit_or_loss: rand(-50000..50000),
    assets_value: rand(50000..200000),
    business: business
  )
end
