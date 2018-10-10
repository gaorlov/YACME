class CreateComponentActions < ActiveRecord::Migration[5.1]
  def change
    create_table :component_actions do |t|
      t.reference :component
      t.reference :action
    end
  end
end
