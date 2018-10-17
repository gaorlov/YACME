class AppComponentAction < ApplicationRecord
  belongs_to :action
  belongs_to :app_component, optional: true

  has_many :jobs, dependent: :destroy, class_name: "ActionJob"
  has_many :resources, dependent: :destroy, class_name: "ActionResource"
  has_many :resource_types, dependent: :destroy, class_name: "ActionResourceType"

  class << self
    def create_from_json( json )
      action_type = Action.find_by_name( json[:action] )

      create!( action: action_type ).tap do | action |
        json.fetch( :jobs, [] ).each do | job_json |
          action.jobs.create( definition: job_json.to_json )
        end

        json.fetch( :resources, [] ).each do | resource_json |
          action.resources.create( definition: resource_json.to_json )
        end

        json.fetch( :resource_types, [] ).each do | resource_type_json |
          action.resource_types.create( definition: resource_type_json.to_json )
        end
      end
    end
  end
end