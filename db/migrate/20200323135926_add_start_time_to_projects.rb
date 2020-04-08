class AddStartTimeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :start_time, :datetime
  end
end
