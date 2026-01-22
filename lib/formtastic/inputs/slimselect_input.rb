# frozen_string_literal: true

module Formtastic
  module Inputs
    # SlimSelect input for Formtastic forms
    class SlimselectInput < Formtastic::Inputs::SelectInput
      include Formtastic::Inputs::Base

      def input_html_options
        super.merge("data-slimselect-input": "1")
      end
    end
  end
end
