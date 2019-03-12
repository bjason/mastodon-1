class CreateGlobalMuteWords < ActiveRecord::Migration[5.2]
  def change
    create_table :global_mute_words do |t|
      t.string :phrase
      t.datetime :created_at

      t.timestamps
    end
  end
end
