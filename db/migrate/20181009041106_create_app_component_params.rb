class CreateAppComponentParams < ActiveRecord::Migration[5.1]
  def change
    create_table :app_component_params do |t|
      t.reference :app_component
      t.reference :compoennt_param
      t.string :value
    end
  end
end
