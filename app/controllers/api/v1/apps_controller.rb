module Api
  module V1
    class AppsController < ApplicationController
      include JSONAPI::Utils

      def create
        @app = App.new resource_params

        if @app.save
          jsonapi_render json: @app, status: :created
        else
          jsonapi_render_errors json: @app, status: :unprocessable_entity
        end
      end

      def index
        @apps = App.all

        jsonapi_render json: @apps
      end

      # ----- Instance Methohds -----

      def update
        if app.update( resource_params )
          jsonapi_render json: app, status: :created
        else
          jsonapi_render_errors json: app, status: :unprocessable_entity
        end
      end

      def show
        jsonapi_render json: app
      end

      def delete
        jsonapi_render json: app.destroy
      rescue ActiveRecord::RecordInvalid => e
        puts "nope lol"
        jsonapi_render_errors json: app, status: :unprocessable_entity
      end

      def rebuild
        app.rebuild_pipeline!

        jsonapi_render json: app, status: :created
      end

      private

      def app
        @app ||= App.find( params[:id] )
      end
    end
  end
end