class AddPreAssessmentToBusiness < ActiveRecord::Migration[7.1]
  def change
    add_column :businesses, :pre_assessment, :integer, default: 20
  end
end
