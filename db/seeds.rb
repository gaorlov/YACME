# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Action.create!( name: "create!",  pipelinable: true,  description: "Create object" )
Action.create!( name: "check",   pipelinable: false, description: "Check on status of object" )
Action.create!( name: "update",  pipelinable: false, description: "Update object properties" )
Action.create!( name: "delete",  pipelinable: false, description: "Destroy object" )
Action.create!( name: "execute", pipelinable: true,  description: "Execute action" )

ComponentType.create!( name: "object", description: "An object component is a compoent that represents a server that runs somewhere and can be maintained." )
action_component = ComponentType.create!( name: "action", description: "An action component is an executable component that is run during regular pieline execution." )

Component.create!( component_type: action_component, name: "Fetch Source", description: "Listen to the source repo on the specified branch for updates; and trigger the pipeline once anything happens", removable: false )