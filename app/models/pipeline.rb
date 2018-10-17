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

    def stub
      @stub ||= YAML::load_file( File.join( __dir__, '../../config/templates/pipeline-stub.yml' ) )
    end
  end

  def initialize( app: nil )
    @app            = app
    @groups         = stub[ :groups ] || []
    @resources      = stub[ :resources ] || []
    @resource_types = stub[ :resource_types ] || []
    @jobs           = stub[ :jobs ] || []
  end

  def as_json
    { groups: groups,
      resources: resources,
      resource_types: resource_types,
      jobs: jobs }
  end

  def groups
    @groups + app.groups.map( &:as_json )
  end

  def resources
    @resources + app_components.map( &:resources ).flatten
  end

  def resource_types
    @resource_types + app_components.map( &:resource_types ).flatten
  end

  def jobs
    @jobs + app_components.map( &:jobs ).flatten
  end

  private

  def stub
    @stub ||= self.class.stub.deep_dup.with_indifferent_access
  end
end