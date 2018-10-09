class CreateAppComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :app_components do |t|
      t.reference :app
      t.reference :component_type
    end
  end
end
