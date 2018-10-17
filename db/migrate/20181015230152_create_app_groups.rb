class CreateAppGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :app_groups do |t|
      t.string :name
      t.string :description
      t.references :app, foreign_key: true

      t.timestamps
    end
  end
end
