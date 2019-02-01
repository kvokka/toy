# frozen_string_literal: true

module Toy
  class Command
    class NotCommandError < StandardError
      def initialize(*)
        super "Do not respond to method ::command"
      end
    end

    class << self
      attr_writer :commands_arity

      def registry
        @registry ||= []
      end

      def commands_arity
        return @commands_arity if @commands_arity&.any?

        @commands_arity = registry.each_with_object({}) do |el, acc|
          acc[el.command] = el.arguments
          acc
        end
      end

      def inherited(base)
        registry << base
        commands_arity = {}
      end
    end
  end
end
