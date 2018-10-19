module Api
  module V1
    class AppResource < JSONAPI::Resource
      has_many :components
      attributes :name, :repo, :description, :removable, :pipeline
    end
  end
end