class CreateFinancialStatements < ActiveRecord::Migration[7.1]
  def change
    create_table :financial_statements do |t|
      t.integer :year
      t.integer :month
      t.integer :profit_or_loss
      t.integer :assets_value
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
