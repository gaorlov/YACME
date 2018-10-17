class CreateComponentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :component_types do |t|
      t.string :name, foreign_key: true
      t.string :description, foreign_key: true
    end
  end
end
