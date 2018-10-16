class AppEnvironment < ApplicationRecord
  belongs_to :app
  belongs_to :environment
end