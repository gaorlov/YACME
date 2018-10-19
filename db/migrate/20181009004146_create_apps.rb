class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :name,   null: false
      t.string :repo,   null: false
      t.string :description
      t.boolean :removable, default: true

      t.timestamps
    end
  end
end
