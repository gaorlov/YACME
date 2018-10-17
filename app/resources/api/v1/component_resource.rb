module Api
  module V1
    class ComponentResource < JSONAPI::Resource
      attributes :name
      has_many :component_params
    end
  end
end