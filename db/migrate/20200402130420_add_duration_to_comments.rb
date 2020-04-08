class AddDurationToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :duration, :integer
  end
end
