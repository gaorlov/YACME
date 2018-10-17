class CreateAppEnvironments < ActiveRecord::Migration[5.1]
  def change
    create_table :app_environments do |t|
      t.references :app, foreign_key: true
      t.references :environment, foreign_key: true

      t.timestamps
    end
  end
end
