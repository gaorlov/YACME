class SourceComponentType
  class << self
    def create( params = {} )
      [
        { 
          action: :execute
          resource_types: []
          resources: [
            {
              name: :source
              type: :git
              source: {
                uri: params.fetch( :uri )
                branch: params.fetch( :branch, :master )
                private_key: private_key
              }
            }
          ],
          jobs: [
            {
              name: Get Source
              build_logs_to_retain: 100
              plan: [
                {
                  get: source
                  trigger: true
                }
              ]
            }
          ]
        }
      ]
    end

    def private_key
      ENV.fetch( "GITHUB_PRIVATE_KEY", "" )
    end
  end
end

