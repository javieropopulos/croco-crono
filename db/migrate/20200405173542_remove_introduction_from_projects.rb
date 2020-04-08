class RemoveIntroductionFromProjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :projects, :introduction, :string
  end
end
