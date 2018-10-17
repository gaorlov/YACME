class Component < ApplicationRecord
  validates :name, uniqueness: true

  belongs_to :component_type

  has_many :component_actions
  has_many :actions, through: :component_actions

  has_many :component_params, as: :params

  def actions_for( params = {}, environment = nil )

  end
end