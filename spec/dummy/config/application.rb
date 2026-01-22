# frozen_string_literal: true

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)
require "activeadmin_slimselect"

module Dummy
  # Dummy application for testing activeadmin_slimselect
  class Application < Rails::Application
    config.load_defaults 7.0

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
