class AddPositionToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :position, :integer
  end
end
