class CreateSharedFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_filters do |t|
      t.datetime :expires_at
      t.text :phrase
      t.string :context
      t.boolean :irreversible

      t.timestamps
    end
  end
end
