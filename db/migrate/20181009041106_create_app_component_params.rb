class CreateAppComponentParams < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_params do |t|
      t.references :app_component, foreign_key: true
      t.references :component_param, foreign_key: true
      t.string :value
    end
  end
end
