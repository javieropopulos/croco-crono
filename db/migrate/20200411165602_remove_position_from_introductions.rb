class RemovePositionFromIntroductions < ActiveRecord::Migration[6.0]
  def change

    remove_column :introductions, :position, :integer
  end
end
