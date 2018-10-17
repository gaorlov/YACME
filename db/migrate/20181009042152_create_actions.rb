class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :description
      t.boolean :pipelinable, false: false
    end
  end
end
