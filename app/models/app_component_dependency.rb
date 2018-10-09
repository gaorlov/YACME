class AppComponentDependency < ApplicationRecord
  belongs_to :parent
  belongs_to :dependent
end