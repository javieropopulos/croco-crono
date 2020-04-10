class CreateIntroductions < ActiveRecord::Migration[6.0]
  def change
    create_table :introductions do |t|
      t.string :contenu
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
