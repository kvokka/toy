# frozen_string_literal: true

module Toy
  module Commands
    class Report < Command
      self.arity = 0
      self.command = "REPORT"

      def action(robot)
        puts "#{robot.x},#{robot.y},#{robot.direction}"
      end

      private

      def command_unsafe?(*)
        false
      end
    end
  end
end
