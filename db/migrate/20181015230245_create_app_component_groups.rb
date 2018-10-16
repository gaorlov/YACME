class CreateAppComponentGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_groups do |t|
      t.references :group
      t.references :app_component_group
    end
  end
end
