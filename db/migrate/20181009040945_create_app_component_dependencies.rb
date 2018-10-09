class CreateAppComponentDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_dependencies do |t|
      t.reference :app_component
    end
  end
end
