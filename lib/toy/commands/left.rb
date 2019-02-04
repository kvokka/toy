# frozen_string_literal: true

module Toy
  module Commands
    class Left < Command
      self.arity = 0
      self.command = "LEFT"

      def action(robot)
        robot.direction = robot.look_around :left
      end

      private

      def command_unsafe?(*)
        false
      end
    end
  end
end
