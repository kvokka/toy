# frozen_string_literal: true

module Toy
  class Robot
    DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

    attr_reader :max_x, :max_y, :commands
    attr_accessor :x, :y, :direction
    def initialize(commands, max_x: 5, max_y: 5)
      @commands = Parser.new(commands).call
      @max_x = max_x
      @max_y = max_y
    end

    def call
      commands.each do |command|
        next if !(x || y) && !command.is_a?(Commands::Place)

        command.call(self)
      end
    end
  end
end
