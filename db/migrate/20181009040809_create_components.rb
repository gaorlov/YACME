class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.string :name, null: false
      t.string :url
      t.string :description
      t.string :removable, default: true
      
      t.references :component_type, foreign_key: true
      t.timestamps
    end
  end
end
