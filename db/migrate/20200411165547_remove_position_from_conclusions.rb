class RemovePositionFromConclusions < ActiveRecord::Migration[6.0]
  def change

    remove_column :conclusions, :position, :integer
  end
end
