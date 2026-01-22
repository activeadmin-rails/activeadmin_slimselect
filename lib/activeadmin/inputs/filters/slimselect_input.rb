# frozen_string_literal: true

module ActiveAdmin
  module Inputs
    module Filters
      # SlimSelect filter input for ActiveAdmin
      class SlimselectInput < ::ActiveAdmin::Inputs::Filters::SelectInput
        def input_html_options
          super.merge("data-slimselect-input": "1")
        end
      end
    end
  end
end
