class CreateAppEnvironments < ActiveRecord::Migration[5.1]
  def change
    create_table :app_environments do |t|
      t.references :app
      t.references :environment

      t.timestamps
    end
  end
end
