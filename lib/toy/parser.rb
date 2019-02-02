# frozen_string_literal: true

module Toy
  class Parser
    SEPARATOR = " "

    attr_reader :commands

    def initialize(commands)
      @commands = commands
    end

    def call
      each_command do |list, klass, i, acc|
        next acc << klass.new if klass.arity.zero?

        acc << klass.new(list[i + 1])
        list[i + 1] = nil
      end
    end

    private

    def each_command
      list = commands.split(SEPARATOR)
      list.each_with_index.each_with_object([]) do |(el, i), acc|
        next acc unless el

        klass = Command.registry[el] or raise NotImplemented, el

        yield list, klass, i, acc
        acc.last.parse_arguments!
        acc
      end
    end
  end
end
