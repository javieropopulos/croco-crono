class AddPositionToIntroductions < ActiveRecord::Migration[6.0]
  def change
    add_column :introductions, :position, :integer
  end
end
