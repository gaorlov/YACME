class CreateAppComponentDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_dependencies do |t|
      t.reference :parent
      t.reference :dependent
    end
  end
end
