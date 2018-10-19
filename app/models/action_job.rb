class ActionJob < ApplicationRecord
  def name
    parsed_definition[ :name ]
  end

  def parsed_definition
    @parsed_defintion ||= JSON.parse( definition ).with_indifferent_access
  end
end