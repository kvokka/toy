# frozen_string_literal: true

module Toy
  module Commands
    class Move < Command
      class << self
        def arguments
          0
        end

        def command
          "MOVE"
        end
      end
    end
  end
end
