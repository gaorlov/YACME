class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.string :name
      t.string :url
      t.string :url_slug
      t.string :description
      
      t.references :component_type, foreign_key: true
      t.timestamps
    end
  end
end
