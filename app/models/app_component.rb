class AppComponent < ApplicationRecord
  belongs_to :app
  belongs_to :component
  belongs_to :environment

  has_many :app_component_groups
  has_many :groups, through: :app_component_groups, class_name: "AppGroup"

  has_many :app_component_params
  has_many :component_params, through: :app_component_params
end