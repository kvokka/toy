# frozen_string_literal: true

module Toy
  module Commands
    class Move < Command
      self.arity = 0
      self.command = "MOVE"

      def action(robot)
        case robot.direction
        when "NORTH" then robot.y += 1
        when "EAST"  then robot.x += 1
        when "WEST"  then robot.x -= 1
        when "SOUTH" then robot.y -= 1
        end
      end

      private

      def command_unsafe?(robot)
        case robot.direction
        when "NORTH" then robot.y + 1 > robot.max_y
        when "EAST"  then robot.x + 1 > robot.max_x
        when "WEST"  then (robot.x - 1).negative?
        when "SOUTH" then (robot.y - 1).negative?
        end
      end
    end
  end
end
