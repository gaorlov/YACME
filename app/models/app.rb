class App < ApplicationRecord
  has_many :app_components, dependent: :destroy
  has_many :components, through: :app_components

  has_many :app_environments, dependent: :destroy
  has_many :environments, through: :app_environments

  has_many :groups, dependent: :destroy, class_name: "AppGroup"

  validates :name, presence: true
  validates :repo, presence: true

  def pipeline
    @pipeline ||= Pipeline.find_or_build( self )
  end

  def rebuild_pipeline!
    @pipeline ||= Pipeline.build_from( self )
  end

  after_commit :create_default_group, on: :create
  after_commit :create_source_component, on: :create

  def create_default_group
    groups.create( name: "Master" )
  end

  def create_source_component
    group = AppGroup.where( name: "Master", app_id: id ).first
    params = { URI: repo,
               BRANCH: :master }
    app_components << AppComponent.create_from_component( component: SourceComponent.find,
                                                          params: params,
                                                          group: group )
  end
end