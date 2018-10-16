class AppComponentGroup < ApplicationRecord
  belongs_to :app_component
  belongs_to :app_group
end