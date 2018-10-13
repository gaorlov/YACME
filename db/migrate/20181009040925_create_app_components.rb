class CreateAppComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :app_components do |t|
      t.references :app
      t.references :component

      t.timestamps
    end
  end
end
