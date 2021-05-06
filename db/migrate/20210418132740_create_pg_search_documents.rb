class CreatePgSearchDocuments < ActiveRecord::Migration[6.1]
  def up
    execute "CREATE EXTENSION pg_trgm;"
    execute "CREATE EXTENSION fuzzystrmatch;"
    say_with_time("Creating table for pg_search multisearch") do
      create_table :pg_search_documents do |t|
        t.text :content
        t.belongs_to :searchable, polymorphic: true, index: true
        t.timestamps null: false
      end
    end
    say_with_time("Adding support functions for pg_search :dmetaphone") do
      execute <<~'SQL'
        CREATE OR REPLACE FUNCTION pg_search_dmetaphone(text) RETURNS text LANGUAGE SQL IMMUTABLE STRICT AS $function$
          SELECT array_to_string(ARRAY(SELECT dmetaphone(unnest(regexp_split_to_array($1, E'\\s+')))), ' ')
        $function$;
      SQL
    end
  end

  def down
    execute "DROP EXTENSION pg_trgm;"
    execute "DROP EXTENSION fuzzystrmatch;"
    say_with_time("Dropping table for pg_search multisearch") do
      drop_table :pg_search_documents
    end
    say_with_time("Dropping support functions for pg_search :dmetaphone") do
      execute <<~'SQL'
        DROP FUNCTION pg_search_dmetaphone(text);
      SQL
    end
  end
end
