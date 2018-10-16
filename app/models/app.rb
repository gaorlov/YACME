class App < ApplicationRecord
  has_many :app_components
  has_many :components, through: :app_components

  has_many :app_environments
  has_many :environments, through: :app_environments

  has_many :groups, class_name: "AppGroup"

  validates :name, presence: true
  validates :repo, presence: true

  def pipeline
    @pipeline ||= Pipeline.find_or_build( self )
  end

  def rebuild_pipeline!
    @pipeline ||= Pipeline.build_from( self )
  end

  after_commit :create_default_group on: :create

  def create_default_group
    groups.create( name: "Master" )
  end
end