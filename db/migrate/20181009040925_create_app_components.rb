class CreateAppComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :app_components do |t|
      t.references :app, foreign_key: true
      t.references :component, foreign_key: true
      t.references :environment, foreign_key: true

      t.timestamps
    end
  end
end
