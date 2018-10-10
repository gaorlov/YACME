class AppComponent < ApplicationRecord
  belongs_to :app
  belongs_to :component

  has_many :app_component_params
  has_many :component_params, through: :app_component_params
end