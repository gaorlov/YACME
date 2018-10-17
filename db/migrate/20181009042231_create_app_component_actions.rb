class CreateAppComponentActions < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_actions do |t|
      t.references :app_component, foreign_key: true
      t.references :action, foreign_key: true
    end
  end
end
