class CreateActionJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :action_jobs do |t|
      t.string :definition
      t.references :app_component_action, foreign_key: true
    end
  end
end
