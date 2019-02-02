# frozen_string_literal: true

module Toy
  class Command
    ARGUMENTS_SEPARATOR = ","

    class InvalidArguments < StandardError; end

    class << self
      attr_writer :registry

      def commands_list
        @commands_list ||= []
      end

      def registry
        return @registry if @registry&.any?

        @registry = commands_list.each_with_object({}) do |el, acc|
          acc[el.command] = el
          acc
        end
      end

      def inherited(base)
        commands_list << base
        registry = {}
        class << base
          attr_accessor :arity, :command
        end
      end
    end

    attr_reader :arguments

    def initialize(arguments = "")
      @arguments = arguments.split ARGUMENTS_SEPARATOR
    end

    def call(robot)
      return robot if command_unsafe?(robot)

      action(robot)
      robot
    end

    def action(*)
      raise NotImplemented
    end

    def parse_arguments!
      raise InvalidArguments if self.class.arity.zero? && arguments && !arguments.empty?

      true
    end

    protected

    def command_unsafe?(*)
      true
    end
  end
end
