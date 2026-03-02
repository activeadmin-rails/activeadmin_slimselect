# frozen_string_literal: true

# DartSass build configuration (Propshaft only).
# ActiveAdmin-Rails 1.8+ uses dartsass-rails so CSS must be pre-compiled via
# `rails dartsass:build`.  Under Sprockets, dartsass-sprockets compiles SCSS
# at request time so this config is not needed.
if !defined?(Sprockets)
  Rails.application.config.dartsass.builds = {
    "active_admin.propshaft.scss" => "active_admin.css",
    "active_admin_print.scss"     => "active_admin/print.css"
  }
end
