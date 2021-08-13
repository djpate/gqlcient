# frozen_string_literal: true

module Gqlclient
  module Errors
    class QueryError < StandardError
      attr_reader :errors

      def initialize(errors)
        @errors = errors
        super(message)
      end

      def message
        str = "#{errors.count} error(s) found in your query: "
        str + errors.map do |error|
          error["message"]
        end.join(', \n')
      end
    end
  end
end
