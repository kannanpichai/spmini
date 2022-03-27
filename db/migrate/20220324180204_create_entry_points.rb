class CreateEntryPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :entry_points do |t|
      t.string :name, null: false, index: { unique: true, name: 'unique_entry_point' } # Unique name for Entry point
      t.text :desc # Short description about the entry point such as Main entrance etc..
      t.timestamps
    end
  end
end
