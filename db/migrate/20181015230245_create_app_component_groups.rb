class CreateAppComponentGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_groups do |t|
      t.references :app_group, foreign_key: true
      t.references :app_component, foreign_key: true
    end
  end
end
