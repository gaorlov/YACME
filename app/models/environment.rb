class Environment < ApplicationRecord
  aas_many :app_environments
  has_many :apps, through: :app_environments

  validates :name, presence: true
end