# frozen_string_literal: true

module Toy
  module Commands
    class Right < Command
      self.arity = 0
      self.command = "RIGHT"

      def action(robot)
        robot.direction = robot.look_around :right
      end

      private

      def command_unsafe?(*)
        false
      end
    end
  end
end
