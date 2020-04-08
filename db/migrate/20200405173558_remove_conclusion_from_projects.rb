class RemoveConclusionFromProjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :projects, :conclusion, :string
  end
end
