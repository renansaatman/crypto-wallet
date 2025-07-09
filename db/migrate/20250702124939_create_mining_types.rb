class CreateMiningTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :mining_types do |t|
      t.string :description
      t.string :acronym

      t.timestamps
    end
  end
end
