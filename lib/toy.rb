# frozen_string_literal: true

require "toy/version"
require "toy/parser"
require "toy/robot"
require "toy/command"

Dir[File.join(__dir__, "toy", "commands", "*.rb")].each { |f| require f }

module Toy
  class Error < StandardError; end
  class NotImplemented < StandardError
    def initialize(command = "")
      super "The command #{command} is not implemented"
    end
  end
end
