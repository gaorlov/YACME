class CreateAppComponentParams < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_params do |t|
      t.references :app_component
      t.references :component_param
      t.string :value
    end
  end
end
