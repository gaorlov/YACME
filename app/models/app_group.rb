class AppGroup < ApplicationRecord
  belongs_to :app

  has_many :app_component_groups
  has_many :app_components, through: :app_component_groups

  def as_json
    { 
      name: name,
      jobs: app_components.map( &:name )
    }
  end
end