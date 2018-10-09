class CreateComponentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.string :name
      t.string :url
      t.string :url_slug
      t.string :description
      t.reference :type
    end
  end
end
