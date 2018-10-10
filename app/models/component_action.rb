class ComponentAction < ApplicationRecord
  belongs_to :action
  belongs_to :component
end