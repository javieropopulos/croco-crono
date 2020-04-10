class DropIntrodutionsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :introdutions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
