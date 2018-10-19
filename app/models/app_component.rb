class AppComponent < ApplicationRecord
  belongs_to :app, optional: true
  belongs_to :component

  delegate :name, :description, to: :component

  belongs_to :environment, optional: true

  has_many :app_component_groups, dependent: :destroy
  has_many :groups, through: :app_component_groups, class_name: "AppGroup"

  has_many :app_component_params, dependent: :destroy
  has_many :component_params, through: :app_component_params

  has_many :actions, class_name: "AppComponentAction", dependent: :destroy

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
    actions.joins( :action ).where( actions: { pipelinable: true } ).first
  end

  class << self

    def create_from_component( component: nil,
                               params: {},
                               environment: nil,
                               group: nil,
                               dependencies: [] )

      create!( component: component ).tap do | app_component |
        actions = component.actions_for( params, environment )
        actions.each do |action_json|
          app_component.actions << AppComponentAction.create_from_json( action_json )
        end
        group.app_components << app_component
      end
    end
  end
end