class AddTsvectorColumns < ActiveRecord::Migration[6.1]
  def up
    add_column :customers, :tsv, :tsvector
    add_index :customers, :tsv, using: 'gin'

    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON customers FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv, 'pg_catalog.english', name, email, bio, company, status
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE customers SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER tsvectorupdate
      ON customers
    SQL

    remove_index :customers, :tsv
    remove_column :customers, :tsv
  end
end
