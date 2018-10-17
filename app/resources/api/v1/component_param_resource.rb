module Api
  module V1
    class ComponentParamResource < JSONAPI::Resource
      attributes :name
      has_many :params
    end
  end
end