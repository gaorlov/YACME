module Api
  module V1
    class ComponentResource < JSONAPI::Resource
      attributes :name
    end
  end
end