class Pipeline
  attr_reader :app

  delegate :app_components, to: :app

  class << self
    def build_from( app )
      new( app: app ).as_json
    end

    def find_or_build( app )
      Rails.cache.fetch app.id do
        build_from app
      end
    end

  end

  def initialize( app: nil )
    @app = app
  end

  def as_json
    { groups: groups,
      resources: resources,
      resource_types: resource_types,
      jobs: jobs }
  end

  def groups
    app.groups.map( &:as_json )
  end

  def resources
    component_section(:resources)
  end

  def resource_types
    component_section(:resource_types)
  end

  def jobs
    component_section(:jobs)
  end

  private

  def component_section( section )
    app_components.map( &section ).flatten.map( &:definition ).map do | definition_json |
      JSON.parse definition_json
    end
  end
end