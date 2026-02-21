# frozen_string_literal: true

# DartSass build configuration.
# ActiveAdmin-Rails 1.8+ uses dartsass-rails (not sassc) so CSS must be
# pre-compiled via `rails dartsass:build` for both Sprockets and Propshaft.
if defined?(Dartsass)
  Rails.application.config.dartsass.builds = {
    "active_admin.scss" => "active_admin.css"
  }
end
