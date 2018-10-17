class AppComponentAction < ApplicationRecord
  belongs_to :action
  belongs_to :app_component

  has_many :action_jobs
  has_many :action_resources
  has_many :action_resource_types
end