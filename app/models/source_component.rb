class SourceComponent < Component
  def actions_for( params = {}, environment = nil )
    [
      { 
        action: :execute,
        resource_types: [],
        resources: [
          {
            name: :source,
            type: :git,
            source: {
              uri: params.fetch( :URI ),
              branch: params.fetch( :BRANCH, :master ),
              private_key: private_key
            }
          }
        ],
        jobs: [
          {
            name: "Get Source",
            build_logs_to_retain: 100,
            plan: [
              {
                get: "source",
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

  class << self
    def find
      find_by name: "Fetch Source"
    end
  end
end
