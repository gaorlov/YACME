class CreateComponentActions < ActiveRecord::Migration[5.1]
  def change
    create_table :component_actions do |t|
      t.references :component
      t.references :action
    end
  end
end
