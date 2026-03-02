# frozen_string_literal: true

require "active_admin"

module ActiveAdmin
  module SlimSelect
    # Rails engine for activeadmin_slimselect
    class Engine < ::Rails::Engine
      engine_name "activeadmin_slimselect"

      # Register assets with ActiveAdmin for Propshaft (no Sprockets directive processing).
      # With Sprockets, users include assets via //= require and @import directives.
      initializer "activeadmin_slimselect.assets" do
        unless defined?(Sprockets)
          ActiveAdmin.application.register_javascript "active_admin/activeadmin_slimselect.js"
          ActiveAdmin.application.register_stylesheet "active_admin/activeadmin_slimselect.css"
        end
      end
    end
  end
end
