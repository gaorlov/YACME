class CreateComponentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :component_types do |t|
      t.string :name
      t.string :description
    end
  end
end
