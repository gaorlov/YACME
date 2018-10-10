class CreateComponentParams < ActiveRecord::Migration[5.1]
  def change
    create_table :component_params do |t|
      t.string :name
      t.string :description
      t.string :type
      t.reference :component

      t.timestamps
    end
  end
end
