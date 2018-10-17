class AppComponent < ApplicationRecord
  belongs_to :app
  belongs_to :component
  belongs_to :environment

  has_many :app_component_groups, dependent: :destroy
  has_many :groups, through: :app_component_groups, class_name: "AppGroup"

  has_many :app_component_params, dependent: :destroy
  has_many :component_params, through: :app_component_params

  has_many :app_component_actions

  def resources
    pipeline_action.resources
  end

  def resource_types
    pipeline_action.resource_types
  end

  def jobs
    pipeline_action.jobs
  end

  def pipeline_action
    app_component_actions.joins( :action ).where( actions: { pipelineable: true } ).first
  end
end