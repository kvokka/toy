# frozen_string_literal: true

module Toy
  module Commands
    class Place < Command
      self.arity = 3
      self.command = "PLACE"

      attr_reader :direction, :x, :y

      def action(robot)
        robot.x = x
        robot.y = y
        robot.direction = direction
      end

      def parse_arguments!
        raise Command::InvalidArguments unless super
        raise Command::InvalidArguments unless arguments.size == self.class.arity

        @x = Integer arguments[0]
        @y = Integer arguments[1]
        raise Command::InvalidArguments unless Robot::DIRECTIONS.include?(arguments[2])

        @direction = arguments[2]
        true
      end

      private

      def command_unsafe?(robot)
        x > robot.max_x || y > robot.max_y || x.negative? || y.negative?
      end
    end
  end
end
