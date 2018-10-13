class Pipeline
  class << self
    def build_from( app_id )
      
    end

    def find_or_build( app_id )
      Rails.cache.fetch app_id do
        build_from app_id
      end
    end
  end
end