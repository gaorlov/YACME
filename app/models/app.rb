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

  after_commit :create_defaults, on: :create
  before_destroy :check_removable

  def create_defaults
    group = groups.create!( name: "Master" )
    params = { URI: repo,
               BRANCH: :master }
    app_components << AppComponent.create_from_component( component: SourceComponent.find,
                                                          params: params,
                                                          group: group )
  end

  def check_removable
    return if removable

    errors.add(:removable, "This application is not removable")
    raise ActiveRecord::RecordInvalid.new(self)
  end
end