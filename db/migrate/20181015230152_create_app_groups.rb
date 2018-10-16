class CreateAppGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :app_groups do |t|
      t.string :name
      t.string :description
      t.references :app

      t.timestamps
    end
  end
end
