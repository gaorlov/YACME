module Api
  module V1
    class ComponentTypeResource < JSONAPI::Resource
      attributes :name
    end
  end
end