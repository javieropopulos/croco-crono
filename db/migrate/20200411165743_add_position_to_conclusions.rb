class AddPositionToConclusions < ActiveRecord::Migration[6.0]
  def change
    add_column :conclusions, :position, :integer
  end
end
