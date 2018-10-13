class App < ApplicationRecord
  has_many :app_components
  has_many :components, through: :app_components

  validates :name, presence: true
  validates :repo, presence: true

  def pipeline
    @pipeline ||= Pipeline.find_or_build( self )
  end

  def rebuild_pipeline!
    @pipeline ||= Pipeline.build_from( self )
  end
end