class CreateAppComponentDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_dependencies do |t|
      t.references :parent
      t.references :dependent
    end
  end
end
