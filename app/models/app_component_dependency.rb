class AppComponentDependency < ApplicationRecord
  belongs_to :parent, class_name: "AppComponent"
  belongs_to :dependent, class_name: "AppComponent"
end