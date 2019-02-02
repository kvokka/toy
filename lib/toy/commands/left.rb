# frozen_string_literal: true

module Toy
  module Commands
    class Left < Command
      self.arity = 0
      self.command = "LEFT"

      def action(robot)
        i = (Robot::DIRECTIONS.index(robot.direction) - 1) % Robot::DIRECTIONS.size
        robot.direction = Robot::DIRECTIONS[i]
      end

      private

      def command_unsafe?(*)
        false
      end
    end
  end
end
